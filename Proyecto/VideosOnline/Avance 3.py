import re
import psycopg2

class Persona ():
    '''
        Clase persona para obtener y modificar la información de la persona
    '''
    
    # Variables de inicialzacion
    
    nombre = ''
    id = ''
    
    # Mensajes estandar para la captura de datos
    queryMsg = {
        'nomina' : "Escriba su Id (número de nómina):\n",
        'usuario' : "Escriba su nombre:\n",
    }
    
    def __init__(self,nombre,id):
        self.nombre = nombre
        self.id = id
    
    def capturarNombre (self):
        '''
            Captura el nombre de la persona
        '''
        valor = input(self.queryMsg['usuario'])
        self.nombre = valor
        
    def capturarId (self):
        '''
            Captura el id/nomida de la persona
        '''
        valor = input(self.queryMsg['nomina'])
        self.id = valor
        
    def imprimirNombre (self):
        '''
            Imprime el nombre de la persona
        '''
        print (self.nombre)
        
    def imprimirId(self):
        '''
            Imprime el id de nomina de la persona
        '''
        print(self.id)
    

class Videos():
    '''
        Clase persona para obtener y modificar la información del video
    '''
    nombre = ''
    extension = ''
    tamaño = ''
    
    queryMsg = {        
        'nombreVid' :  'Nombre del video:\n',
        'extensionVid' : 'Extensión del video (.mpg, .mov, etc):\n',
        'tamañoVidAlfa' : 'Tamaño (en megas y no mayor a 3):\n',
    }
    
    def __init__(self,nombre,extension,tamaño):
        self.nombre = nombre
        self.extension = extension
        self.tamaño = tamaño
    
    def capturarNombre(self):
        valor = input(self.queryMsg['nombreVid'])
        self.nombre = valor
        
    def capturarExtension(self):
        valor = input(self.queryMsg['extensionVid'])
        self.extension = valor

    def capturarTamaño(self) :
        valor = input(self.queryMsg['tamañoVidAlfa'])
        self.tamaño = valor
        
    def imprimirNombre(self):
        '''
            Imprime el nombre del video
        '''
        print(self.nombre)

        
    def imprimirExtension(self):
        '''
            Imprime la extensión del video
        '''
        print(self.extension)
        
    def imprimirTamaño(self):
        '''
            Imprime el tamaño del video
        '''
        print(self.tamaño)
        

class DataBase ():
    
    #Definiendo parametros para la conexion a la base de datos
    
    conn = psycopg2.connect(
        database="pro_gol",
        user="webuser",
        password="userweb",
        host="localhost",
        port="5432"
    )
        
    def createTableUsuarios(self):
        sqlstm = '''CREATE TABLE IF NOT EXISTS public.tbl_usuarios
            (
            nombre character varying(50) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
            id character varying(10) COLLATE pg_catalog."default" NOT NULL,
            CONSTRAINT tbl_usuarios_pkey PRIMARY KEY (id)
            )
        '''
        cursor = self.conn.cursor()
        cursor.execute(sqlstm)
        
    def createTableVideos(self):
        sqlstm = '''CREATE TABLE IF NOT EXISTS tbl_videos
            (
                id integer NOT NULL DEFAULT nextval('tbl_videos_id_seq'::regclass),
                nombre character varying(50) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
                extension character varying(5) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
                size integer,
                CONSTRAINT tbl_videos_pkey PRIMARY KEY (id)
            )
        '''
        cursor = self.conn.cursor()
        cursor.execute(sqlstm)
        
    def createTableUsuariosVideos(self):
        sqlstm = '''CREATE TABLE IF NOT EXISTS tbl_usuarios_videos
            (
                id_user character varying(10) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
                id_video integer,
                CONSTRAINT tbl_usuarios_videos_id_user_fkey FOREIGN KEY (id_user)
                    REFERENCES public.tbl_usuarios (id) MATCH SIMPLE
                    ON UPDATE NO ACTION
                    ON DELETE NO ACTION,
                CONSTRAINT tbl_usuarios_videos_id_video_fkey FOREIGN KEY (id_video)
                    REFERENCES public.tbl_videos (id) MATCH SIMPLE
                    ON UPDATE NO ACTION
                    ON DELETE NO ACTION
            )
        '''
        cursor = self.conn.cursor()
        cursor.execute(sqlstm)

        
    
    def getTableInfo(self,table) :
        
        # Creando un cursor()
        cursor = self.conn.cursor()

        sqlstm = 'Select * from ' + table
        cursor.execute(sqlstm)
        # Cerrando la conexión
        return cursor.fetchall()

    def insertTableInfo(self,table,keys,values) :
        
        # Creando un cursor()
        cursor = self.conn.cursor()
        
        tmpquery = []
        for i in range(len(values)) :
            tmpquery.append("%s")
                    
        sqlstm = 'insert into ' + table + ' (' + ",".join(keys) + ') values (' + ",".join(tmpquery) +')'
                
        if (table == "tbl_videos") :
            sqlstm += ' returning id'
        elif (table == "tbl_usuarios"):            
            sqlstm += ' ON CONFLICT (id) DO UPDATE SET nombre = EXCLUDED.nombre'
            
        cursor.execute(sqlstm,tuple(values))
        # Cerrando la conexión
        self.conn.commit()
        if (table == "tbl_videos") :
            return cursor.fetchone()[0]
    
    def closeConnection (self):
        self.conn.close()
        

class Applicacion () :
    '''
        Clase Applicacion en donde se inicializa la funcionalidad de la apliación
    '''

    # Inicializacion de atributos
    numVids = ''
    usuario = Persona(None,None)
    
    # Mensajes estandar para la captura de datos
    queryMsg = {
        'cantidadVids' : "¿Cuántos videos subirá?\n",
        'tituloVid' : "Título del video:\n",
        'infoConfirmation' : "¿Es correcta la información? (Sí/No) \n",
        'exitConfirmation' : 'Desea salir del sistema? (Sí/No)\n'
    }
    
    # Mensajes estandar para la validación de datos
    validationMsg = {
        'nomina' : "Número de nómina: \"Nómina en formato incorrecto. Debe capturar solo números y letras.\"" ,
        'usuario' : "Nombre del usuario: \"Nombre de usuario en formato incorrecto. Debe capturar solo letras.\”" ,                
        'cantidadVids' : "Cantidad de videos a subir: \"Cantidad de videos en formato incorrecto. Debe capturar solo números.\"",
        'tituloVid' : "Título del video: \"Título del video en formato incorrecto. Debe capturar solo números y letras.\"",
        'nombreVid' : "Nombre del video: \"Nombre del video en formato incorrecto. Debe capturar solo números y letras.\"",
        'extensionVid' :  "Extensión del video en formato incorrecto. Debe capturar solo números y letras.\"",
        'tamañoVidAlfa' :  "Tamaño del video en formato incorrecto. Debe capturar solo números",
        'tamañoVidNum' :  "El archivo no debe pesar más de 3 MB"
    }
    
    # Valores de regex
    matchRegex = {
        'nomina' : re.compile('^[a-zA-Z0-9]+$'),            
        'usuario' : re.compile('^[a-zA-Z]+\s*[a-zA-Z]*$'),            
        'cantidadVids' : re.compile('^[0-9]+$'),            
        'tituloVid' : re.compile('^[a-zA-Z0-9]+$'),            
        'nombreVid' : re.compile('^[a-zA-Z0-9]+$'),   
        'extensionVid' : re.compile('^[a-zA-Z0-9]+$'),         
        'tamañoVidAlfa' : re.compile('^[0-9]+$'),
        'tamañoVidNum' : re.compile('^[0-9]{1}$')
    }
    
    def __init__(self):
        '''
            Inicializacion de la aplicación al llamar el metodo pedirDatos()
        '''
        self.pedirDatos()
        
    
    def pedirDatos(self):
        '''
            Metodo pedirDatos en donde se le pide al usuario por medio del 
            prompt los valores del número de nomina, el nombre del usuario y 
            el número de videos a subir
        '''
        
        self.usuario = Persona(None,None)
        # Se asigna a self el numero de nomina como un int y se valida su integridad
        tipo = 'nomina'
        self.pedirValor(None,tipo)      
        
            
        # Se asigna a self el nombre del usuario y se valida su integridad
        tipo = 'usuario'
        self.pedirValor(None,tipo) 
            
        # se Asigna a self el numero de videos que subirá el usuario y se valida su integridad
        tipo = 'cantidadVids'
        self.numVids = self.pedirValor(self.queryMsg[tipo],tipo)
        self.videos = {}
        # Se llama el metodo que imprime el banner
        self.msgBienvenida()
    
    def pedirValor(self,msg,tipo):
        while True:
            if (tipo == 'nomina') :
                self.usuario.capturarId()
                valor = self.usuario.id
            elif (tipo == 'usuario') :
                self.usuario.capturarNombre()
                valor = self.usuario.nombre
            else :
                valor = input(msg)
            datoValidado = self.validarDatos(tipo,valor)
            if (tipo == 'tamañoVidAlfa'):
                if (datoValidado) :
                    tipo = 'tamañoVidNum'
                    datoValidado = self.validarDatos(tipo,valor)
                    
            if datoValidado :
                return valor
            else:
                self.imprimirValidacion(tipo,datoValidado,valor)
                   
    def msgBienvenida(self):
        '''
            Imprime el mensaje de bienvenida de la aplicacion con los datos obtenidos de la consola
            Pregunta por una confirmación para verificar que los datos sean correctos
            Si la respuesta es "Sí" se piden los datos de los videos en caso de que sea no se busca
            la confirmación de la salida de la aplicación
        '''
        print(f'Bienvenid@ {self.usuario.nombre}, tu número de nómina es {self.usuario.id} y estás intentando subir {self.numVids} videos.')
        while True:
            confirmacion = str(input(self.queryMsg['infoConfirmation']))
            # punto de control en donde se piden los datos de los videos o caso contrario se confirma si se quiere salir del programa
            if (confirmacion == 'Sí'):
                self.datosVideos()
                break
            elif(confirmacion == 'No') :
                self.confirmarSalida()
                break
    
    def confirmarSalida(self):
        '''
            Metodo en el que se interactua con el usuario para confirmar su salida de la aplicación.
            En caso de que la confirmación sea positiva se manda un mensaje de despedida
            en caso contrario se vuelven a pedir los datos del usuario
        '''
        while True:
            salida = str(input(self.queryMsg['exitConfirmation']))
            #Punto de control en donde se sale del programa por confirmacion o se vuelven a pedir los datos
            if salida == 'Sí' :
                print(f'Muchas gracias por haber usado nuestro sistema, hasta pronto.')
                exit()
            elif salida == 'No' :
                self.pedirDatos()
                break
    
    def datosVideos(self):
        '''
            Metodo en donde se piden los datos de titulo, nombre, ectension y tamaño por
            cada uno de los video que se van a agregar
        '''
        
        # Ciclo en donde se piden, validan y asigan los datos de cada video
        totalVids = int(self.numVids)
        while totalVids > 0:
            print (f'-'*15)
            print(f'Info video {int(self.numVids) - totalVids + 1}')
            print (f'-'*15)
            video = Videos(None,None,None)
            
            tipo = 'tituloVid'
            titulo = self.pedirValor(self.queryMsg[tipo],tipo)
                        
            while True :
                tipo = 'nombreVid'
                video.capturarNombre()
                datoValidado = self.validarDatos(tipo,video.nombre)
                if not datoValidado :
                    video.nombre = None
                    self.imprimirValidacion(tipo,datoValidado,video.nombre)
                else :
                    break
        
            while True :
                tipo = 'extensionVid'
                video.capturarExtension()
                datoValidado = self.validarDatos(tipo,video.extension)
                if not datoValidado :
                    video.extension = None
                    self.imprimirValidacion(tipo,datoValidado,video.extension)
                else :
                    break
            #video.capturarExtension(self.pedirValor(self.queryMsg[tipo],tipo))
            
            tipo = 'tamañoVidAlfa'
        
            while True :
                tipo = 'tamañoVidAlfa'
                video.capturarTamaño()
                datoValidado = self.validarDatos(tipo,video.tamaño)
                if not datoValidado :
                    video.tamaño = None
                    self.imprimirValidacion(tipo,datoValidado,video.tamaño)
                else :
                    tipo = 'tamañoVidNum'
                    datoValidado = self.validarDatos(tipo,video.tamaño)
                    if not datoValidado :
                        video.tamaño = None
                        self.imprimirValidacion(tipo,datoValidado,video.tamaño)
                    else :
                        break
            
            self.videos[totalVids] = {
                'titulo' : titulo,
                'info': video
            }
            totalVids-=1
        
        # Obtenidos los datos se pide crear el archivo con los datos obtenidos
        #self.crearArchivo("salida.txt")
        self.agregarDatos()
    
    def validarDatos(self,tipo,valor):
        '''
            Validación por medio de expresiones regulares para validar los datos que se piden al
            usuario dependiendo del tipo de dato y su valor
        '''
        # Se valida por calificacion de dato y expresion regular si la validadcion es verdadera o falsa
        result = re.match(self.matchRegex[tipo],valor)
        if tipo == 'tamañoVidNum' :
            if (result):
                if (float(valor) > 3) :
                    result = False
                else :
                    result = True
        if (result):
            return True
        else:
            return False
    
    def imprimirValidacion(self,tipo,resultado,value) :
        '''
            Metodo en donde se asignan los mensjes de error y las excepciones en caso de agregar un valor erroneo
        '''
        # Se generan los mensajes en pantalla de acuerdo con la calsificacion del dato
        msg = ""
        if (resultado == False ) :
            msg = self.validationMsg[tipo]        
        print(msg)
        return value
    
    def crearArchivo(self, nombreArchivo) :
        '''
            Metodo en donde se asigna el nombre del archivo a escribir
            se itera al objeto self de tal manera que se obtienen todos los
            valores de las diferentes llaves
            
        '''
        print(f'Creando archivo {nombreArchivo}')
        # Se abre el archivo
        with open(nombreArchivo, 'a') as f:
            values = []
            
            # Se itera por el objeto self para agregar los valores a una lista
            for key,value in self.__dict__.items() :
                if not callable(getattr(self, key)):
                    if (key == 'usuario'):
                        values.append(self.usuario.id)
                        self.usuario.imprimirId()
                        values.append(self.usuario.nombre)
                        self.usuario.imprimirNombre()
                    elif (key != 'videos') :
                        values.append(value)
                    else :                        
                        for key1 in self.__dict__[key]:
                            values.append(self.__dict__[key][key1]['titulo'])
                            self.__dict__[key][key1]['info'].imprimirNombre()
                            self.__dict__[key][key1]['info'].imprimirExtension()
                            self.__dict__[key][key1]['info'].imprimirTamaño()
                            values.append(self.__dict__[key][key1]['info'].nombre)
                            values.append(self.__dict__[key][key1]['info'].extension)
                            values.append(self.__dict__[key][key1]['info'].tamaño)
          
            # se une la lista con el caracter "|"
            line = "|".join(values)
            # Se escribe en el archivo la linea con el formato deseado.
            f.write(line+"\n")
            #print(line)
    
    def agregarDatos(self):      

        conexion = DataBase()
        conexion.createTableUsuarios();
        conexion.createTableVideos();
        conexion.createTableUsuariosVideos();
        # Se itera por el objeto self para agregar los valores a una lista
        for key,value in self.__dict__.items() :
            if not callable(getattr(self, key)):
                if (key == 'usuario'):
                    dbValues = []
                    dbKeys = []
                    dbKeys.append('id')
                    dbKeys.append('nombre')
                    dbValues.append(self.usuario.id)
                    dbValues.append(self.usuario.nombre)                    
                    self.usuario.imprimirId()
                    self.usuario.imprimirNombre()
                    
                    conexion.insertTableInfo('tbl_usuarios',dbKeys,dbValues)

                elif (key != 'videos'):
                    pass
                else :                                         
                    for key1 in self.__dict__[key]: 
                        dbValues = []
                        dbKeys = []
                        dbKeys.append('nombre')
                        dbKeys.append('extension')
                        dbKeys.append('size')  
                                                                    
                        dbValues.append(self.__dict__[key][key1]['info'].nombre)
                        dbValues.append(self.__dict__[key][key1]['info'].extension)
                        dbValues.append(self.__dict__[key][key1]['info'].tamaño) 
                        
                        self.usuario.imprimirId()
                        self.usuario.imprimirNombre()
                    
                        self.__dict__[key][key1]['info'].imprimirNombre()
                        self.__dict__[key][key1]['info'].imprimirExtension()
                        self.__dict__[key][key1]['info'].imprimirTamaño()
                        
                        vidid = conexion.insertTableInfo('tbl_videos',dbKeys,dbValues)
                        dbKeys = []
                        dbKeys.append("id_user")
                        dbKeys.append("id_video")
                        dbValues = []
                        dbValues.append(self.usuario.id)
                        dbValues.append(vidid)
                        conexion.insertTableInfo('tbl_usuarios_videos',dbKeys,dbValues)
        #print (conexion.getTableInfo('tbl_usuarios'))
        #print (conexion.getTableInfo('tbl_videos'))
        #print (conexion.getTableInfo('tbl_usuarios_videos'))
        conexion.closeConnection()
    
# llamando la clase de la aplicacion
app = Applicacion()
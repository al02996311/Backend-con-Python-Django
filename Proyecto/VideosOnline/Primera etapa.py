import re
class Applicacion () :
    '''
        Clase Applicacion en donde se inicializa la funcionalidad de la apliación
    '''

    usuarioId = ''
    usuarioNombre = ''
    numVids = ''
    videos = {}
    
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
        # Se asigna a self el numero de nomina como un int y se valida su integridad
        mensaje = 'Escriba su Id (número de nómina):\n'
        tipo = 'nomina'
        self.usuarioId = self.pedirValor(mensaje,tipo)        
        # Se asigna a self el nombre del usuario y se valida su integridad
        mensaje = 'Escriba su nombre:\n'
        tipo = 'usuario'
        self.usuarioNombre = self.pedirValor(mensaje,tipo)
        # se Asigna a self el numero de videos que subirá el usuario y se valida su integridad
        mensaje = '¿Cuántos videos subirá?\n'
        tipo = 'cantidadVids'
        self.numVids = self.pedirValor(mensaje,tipo)
        self.videos = {}
        
        # Se llama el metodo que imprime el banner
        self.msgBienvenida()
    
    def pedirValor(self,msg,tipo):
        while True:
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
        print(f'Bienvenid@ {self.usuarioNombre}, tu número de nómina es {self.usuarioId} y estás intentando subir {self.numVids} videos.')
        while True:
            confirmacion = str(input('¿Es correcta la información? (Sí/No) \n'))
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
            salida = str(input('Desea salir del sistema? (Sí/No)\n'))
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
            mensaje = 'Título del video:\n'
            tipo = 'tituloVid'
            titulo = self.pedirValor(mensaje,tipo)
            mensaje = 'Nombre del video:\n'
            tipo = 'nombreVid'
            nombre = self.pedirValor(mensaje,tipo)
            mensaje = 'Extensión del video (.mpg, .mov, etc):\n'
            tipo = 'extensionVid'
            extension = self.pedirValor(mensaje,tipo)
            mensaje = 'Tamaño (en megas y no mayor a 3):\n'
            tipo = 'tamañoVidAlfa'
            
            tamano = self.pedirValor(mensaje,tipo)
            
            self.videos[totalVids] = {
                'titulo' : titulo,
                'nombre' : nombre,
                'extension' : extension,
                'tamaño' : tamano
            }
            totalVids-=1
        
        # Obtenidos los datos se pide crear el archivo con los datos obtenidos
        self.crearArchivo("salida.txt")
    
    def validarDatos(self,tipo,valor):
        '''
            Validación por medio de expresiones regulares para validar los datos que se piden al
            usuario dependiendo del tipo de dato y su valor
        '''
        # Se valida por calificacion de dato y expresion regular si la validadcion es verdadera o falsa
        if tipo == 'nomina' :
            patern = re.compile('^[a-zA-Z0-9]+$')
            result = re.match(patern,valor)
        elif tipo == 'usuario' :
            patern = re.compile('^[a-zA-Z]+\s*[a-zA-Z]*$')
            result = re.match(patern,valor)
        elif tipo == 'cantidadVids' :
            patern = re.compile('^[0-9]+$')
            result = re.match(patern,valor)
        elif tipo == 'tituloVid' :
            patern = re.compile('^[a-zA-Z0-9]+$')
            result = re.match(patern,valor)
        elif tipo == 'nombreVid' :
            patern = re.compile('^[a-zA-Z0-9]+$')
            result = re.match(patern,valor)
        elif tipo == 'extensionVid' :
            patern = re.compile('^[a-zA-Z0-9]+$')
            result = re.match(patern,valor)
        elif tipo == 'tamañoVidAlfa' :
            if valor.isdigit():
                result = True
            else :
                result = False
        elif tipo == 'tamañoVidNum' :
            patern = re.compile('^[0-9]{1}$')
            result = re.match(patern,valor)
            if (result):
                if (float(valor) > 3) :
                    result = False
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
        if tipo == 'nomina' :
            if resultado == False :
                msg  = "Número de nómina: \"Nómina en formato incorrecto. Debe capturar solo números y letras.\"" 
        elif tipo == 'usuario' :
            if resultado == False :
                msg  = "Nombre del usuario: \"Nombre de usuario en formato incorrecto. Debe capturar solo letras.\”"                 
        elif tipo == 'cantidadVids' :
            if resultado == False :
                msg  = "Cantidad de videos a subir: \"Cantidad de videos en formato incorrecto. Debe capturar solo números.\""
        elif tipo == 'tituloVid' :
            if resultado == False :
                msg  = "Título del video: \"Título del video en formato incorrecto. Debe capturar solo números y letras.\""
        elif tipo == 'nombreVid' :
            if resultado == False :
                msg  = "Nombre del video: \"Nombre del video en formato incorrecto. Debe capturar solo números y letras.\""
        elif tipo == 'extensionVid' :
            if resultado == False :
                msg  = "Extensión del video en formato incorrecto. Debe capturar solo números y letras.\""
        elif tipo == 'tamañoVidAlfa' :
            if resultado == False :
                msg = "Tamaño del video en formato incorrecto. Debe capturar solo números"
        elif tipo == 'tamañoVidNum' :
            if resultado == False :
                msg = "El archivo no debe pesar más de 3 MB"        
        
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
                    if (key != 'videos') :
                        values.append(value)
                    else :                        
                        for key1 in self.__dict__[key]:
                            for values2 in self.__dict__[key][key1].values():
                                values.append(values2)
            
            # se une la lista con el caracter "|"
            line = "|".join(values)
            # Se escribe en el archivo la linea con el formato deseado.
            f.write(line+"\n")
            #print(line)
                
# llamando la clase de la aplicacion
app = Applicacion()
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from gestionVideos.otherScripts.Avance4 import *
from django.contrib import messages
from .models import tbl_usuarios,tbl_videos,tbl_usuarios_videos

# Create your views here.

def capturarDatosUsuario(request):
    return render(request, 'pro_gol/datosUsuario.html', {})

def validarDatosUsuario(request):
    if (request.method == "POST"):
                
        nomina = request.POST['u_nomina']
        nombre = request.POST['u_nombre']
        Videos = request.POST['u_numvideo']
        
        if (nomina and nombre and Videos):
            app = Applicacion()
            app.usuario.id = nomina
            app.usuario.nombre = nombre
            tipo = "nomina"
            datoValidado = app.validarDatos(tipo,app.usuario.id)
            if (not datoValidado) :
                result = app.imprimirValidacion(tipo,datoValidado,app.usuario.id)
                context = {
                    "u_nomina" : nomina,
                    "u_nombre" : nombre,
                    "u_numvideo" : Videos,
                }
                messages.error(request,result)
                return render(request,'pro_gol/datosUsuario.html', context)
            tipo = "usuario"
            datoValidado = app.validarDatos(tipo,app.usuario.nombre)
            if (not datoValidado) :
                result = app.imprimirValidacion(tipo,datoValidado,app.usuario.nombre)
                context = {
                    "u_nomina" : nomina,
                    "u_nombre" : nombre,
                    "u_numvideo" : Videos,
                    "messaget" : result,
                }
                messages.error(request,result)
                return render(request, 'pro_gol/datosUsuario.html', context)

            tipo = "cantidadVids"
            datoValidado = app.validarDatos(tipo,Videos)
            if (not datoValidado) :
                result = app.imprimirValidacion(tipo,datoValidado,app.usuario.nombre)
                context = {
                    "u_nomina" : nomina,
                    "u_nombre" : nombre,
                    "u_numvideo" : Videos,
                    "messaget" : result,
                }
                messages.error(request,result)
                return render(request, 'pro_gol/datosUsuario.html', context)
            
        numVideos = []
        for i in range (0, int(Videos)):
            numVideos.append(i+1)
        context = {
            "u_nomina" : nomina,
            "u_nombre" : nombre,
            "u_numvideo" : Videos,
            "numVideos" : numVideos,            
        }
        result = "Bienvenid@ " + app.usuario.nombre + ", tu número de nómina es "+ app.usuario.id + " y estás intentando subir " + Videos + " videos. ¿Es correcta la información?"
        
        context = {
            "u_nomina" : nomina,
            "u_nombre" : nombre,
            "u_numvideo" : Videos,
            "numVideos" : numVideos,
        }
        
        print(request.POST['confirmation'])
        messages.info(request,result)
        if(request.POST['confirmation'] == "true"):
             
            return render(request, 'pro_gol/datosVideos.html', context)
        else :
            return render(request, 'pro_gol/datosUsuario.html', context)
            
def fullData(request):
    if (request.method == "POST"):
        nomina = request.POST['u_nomina']
        nombre = request.POST['u_nombre']
        Videos = request.POST['u_numvideo']
        
        numVideos = []
        for i in range (0, int(Videos)):
            numVideos.append(i+1)
            
        data_usuario = tbl_usuarios(id=nomina, nombre=nombre)
        data_usuario.save()
                   
        for index in range (1, int(Videos)+1):
            
            app = Applicacion()

            video_titulo = request.POST['v_titulo_' + str(index) ]
            tipo = "tituloVid"
            datoValidado = app.validarDatos(tipo,video_titulo)
            if (not datoValidado):
                result = "Video #" + str(index) + " " + app.imprimirValidacion(tipo,datoValidado,video_titulo)
                context = {
                        "u_nomina" : nomina,
                        "u_nombre" : nombre,
                        "u_numvideo" : Videos,
                        "numVideos" : numVideos,
                        'v_titulo' : {},
                        'v_nombre': {},
                        'v_extension': {},
                        'v_size' : {},
                }
                for indexTmp in range (1, int(Videos)+1):                        
                    context['v_titulo'][indexTmp] = request.POST['v_titulo_' + str(indexTmp) ]
                    context['v_nombre'][indexTmp] = request.POST['v_nombre_' + str(indexTmp) ]
                    context['v_extension'][indexTmp] = request.POST['v_extension_' + str(indexTmp) ]
                    context['v_size'] [indexTmp] = request.POST['v_size_' + str(indexTmp) ]
                
                messages.error(request,result)
                return render(request, 'pro_gol/datosVideos.html', context)
 
            video_nombre = request.POST['v_nombre_' + str(index) ]
            tipo = "nombreVid"
            datoValidado = app.validarDatos(tipo,video_nombre)
            if (not datoValidado):
                result = "Video #" + str(index) + " " + app.imprimirValidacion(tipo,datoValidado,video_nombre)
                context = {
                        "u_nomina" : nomina,
                        "u_nombre" : nombre,
                        "u_numvideo" : Videos,
                        "numVideos" : numVideos,
                        'v_titulo' : {},
                        'v_nombre': {},
                        'v_extension': {},
                        'v_size' : {},
                }
                for indexTmp in range (1, int(Videos)+1):                        
                    context['v_titulo'][indexTmp] = request.POST['v_titulo_' + str(indexTmp) ]
                    context['v_nombre'][indexTmp] = request.POST['v_nombre_' + str(indexTmp) ]
                    context['v_extension'][indexTmp] = request.POST['v_extension_' + str(indexTmp) ]
                    context['v_size'] [indexTmp] = request.POST['v_size_' + str(indexTmp) ]
                
                messages.error(request,result)
                return render(request, 'pro_gol/datosVideos.html', context)  
                      
            video_extension = request.POST['v_extension_' + str(index) ]
            tipo = "extensionVid"
            datoValidado = app.validarDatos(tipo,video_extension)
            if (not datoValidado):
                result = "Video #" + str(index) + " " + app.imprimirValidacion(tipo,datoValidado,video_extension)
                context = {
                        "u_nomina" : nomina,
                        "u_nombre" : nombre,
                        "u_numvideo" : Videos,
                        "numVideos" : numVideos,
                        'v_titulo' : {},
                        'v_nombre': {},
                        'v_extension': {},
                        'v_size' : {},
                }
                for indexTmp in range (1, int(Videos)+1):                        
                    context['v_titulo'][indexTmp] = request.POST['v_titulo_' + str(indexTmp) ]
                    context['v_nombre'][indexTmp] = request.POST['v_nombre_' + str(indexTmp) ]
                    context['v_extension'][indexTmp] = request.POST['v_extension_' + str(indexTmp) ]
                    context['v_size'] [indexTmp] = request.POST['v_size_' + str(indexTmp) ]
                
                messages.error(request,result)
                return render(request, 'pro_gol/datosVideos.html', context)
            
            video_size = request.POST['v_size_' + str(index) ]
            tipo = "tamañoVidAlfa"
            datoValidado = app.validarDatos(tipo,video_size)
            if (not datoValidado):
                result = "Video #" + str(index) + " " + app.imprimirValidacion(tipo,datoValidado,video_size)
                context = {
                        "u_nomina" : nomina,
                        "u_nombre" : nombre,
                        "u_numvideo" : Videos,
                        "numVideos" : numVideos,
                        'v_titulo' : {},
                        'v_nombre': {},
                        'v_extension': {},
                        'v_size' : {},
                }
                for indexTmp in range (1, int(Videos)+1):                        
                    context['v_titulo'][indexTmp] = request.POST['v_titulo_' + str(indexTmp) ]
                    context['v_nombre'][indexTmp] = request.POST['v_nombre_' + str(indexTmp) ]
                    context['v_extension'][indexTmp] = request.POST['v_extension_' + str(indexTmp) ]
                    context['v_size'] [indexTmp] = request.POST['v_size_' + str(indexTmp) ]
                
                messages.error(request,result)
                return render(request, 'pro_gol/datosVideos.html', context)
            
            tipo = "tamañoVidNum"
            datoValidado = app.validarDatos(tipo,video_size)
            if (not datoValidado):
                result = "Video #" + str(index) + " " +  app.imprimirValidacion(tipo,datoValidado,video_size)
                context = {
                        "u_nomina" : nomina,
                        "u_nombre" : nombre,
                        "u_numvideo" : Videos,
                        "numVideos" : numVideos,
                        'v_titulo' : {},
                        'v_nombre': {},
                        'v_extension': {},
                        'v_size' : {},
                }
                for indexTmp in range (1, int(Videos)+1):                        
                    context['v_titulo'][indexTmp] = request.POST['v_titulo_' + str(indexTmp) ]
                    context['v_nombre'][indexTmp] = request.POST['v_nombre_' + str(indexTmp) ]
                    context['v_extension'][indexTmp] = request.POST['v_extension_' + str(indexTmp) ]
                    context['v_size'] [indexTmp] = request.POST['v_size_' + str(indexTmp) ]
                
                messages.error(request,result)
                return render(request, 'pro_gol/datosVideos.html', context)
            
            data_video = tbl_videos(nombre=video_nombre,extension=video_extension,size=video_size)
            data_video.save()
            
            video_db_id = (tbl_videos.objects.last()).id
            data_user_video = tbl_usuarios_videos(id_user_id=nomina,id_video_id=video_db_id)
            data_user_video.save()
               
    return render(request, 'pro_gol/thankyou.html', {})

def popup(request):
    messages.error(request,"result")
    return render(request, 'pro_gol/popup.html', {})
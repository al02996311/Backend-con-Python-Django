from django.contrib import admin


# Register your models here.
from gestionVideos.models import tbl_usuarios, tbl_videos, tbl_usuarios_videos

class usuariosAdmin(admin.ModelAdmin):
    list_display= ("id","nombre")

class videoAdmin(admin.ModelAdmin):
    list_display= ("id","nombre","extension","size")

class usuarios_videosAdmin(admin.ModelAdmin):
    list_display= ("id_user","id_video")
    
admin.site.register(tbl_usuarios,usuariosAdmin)
admin.site.register(tbl_videos,videoAdmin)
admin.site.register(tbl_usuarios_videos,usuarios_videosAdmin)


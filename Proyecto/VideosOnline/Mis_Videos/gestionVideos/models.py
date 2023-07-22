from django.db import models

class tbl_usuarios(models.Model):
    id = models.CharField(max_length=10,primary_key=True)
    nombre = models.CharField(max_length=50)
    
    def __str__(self):
        return self.id,self.nombre

class tbl_videos(models.Model):
    id = models.AutoField(primary_key=True)
    nombre =models.CharField(max_length=50)
    extension =models.CharField(max_length=5)
    size = models.IntegerField()
    
    def __str__(self):
        return self.id,self.nombre,self.extension,self.size

class tbl_usuarios_videos(models.Model):
    id_user =models.ForeignKey(tbl_usuarios,models.DO_NOTHING)
    id_video = models.ForeignKey(tbl_videos,models.DO_NOTHING)
    
    def __str__(self):
        return self.id_user,self.id_video


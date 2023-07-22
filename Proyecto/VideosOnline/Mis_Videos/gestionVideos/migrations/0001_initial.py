# Generated by Django 4.2.3 on 2023-07-21 03:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='tbl_usuarios',
            fields=[
                ('id', models.CharField(max_length=10, primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='tbl_videos',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=50)),
                ('extension', models.CharField(max_length=5)),
                ('size', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='tbl_usuarios_videos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('id_user', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='gestionVideos.tbl_usuarios')),
                ('id_video', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='gestionVideos.tbl_videos')),
            ],
        ),
    ]
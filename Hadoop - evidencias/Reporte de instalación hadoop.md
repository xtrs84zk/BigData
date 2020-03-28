# Instalación hadoop

## Configuración usuario

- Se crea el usuario hdc con una contraseña personal

![Screen Shot 2020-03-09 at 1.30.38 PM](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/Screen Shot 2020-03-09 at 1.30.38 PM.png)

- Se toma propiedad sobre /u01

![Screen Shot 2020-03-09 at 1.33.33 PM](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/Screen Shot 2020-03-09 at 1.33.33 PM.png)

- Se toma propiedad de /u02

  ![Screen Shot 2020-03-09 at 1.33.50 PM](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/Screen Shot 2020-03-09 at 1.33.50 PM.png)

## Establecer ficheros

- Dentro de /u02, están los archivos de instalación de hadoop y el jdk

  ![Screen Shot 2020-03-09 at 1.34.48 PM](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/Screen Shot 2020-03-09 at 1.34.48 PM.png)

- Se descomprimen dichos archivos, lo cual deja este árbol:

  ![Screen Shot 2020-03-09 at 1.45.22 PM](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/Screen Shot 2020-03-09 at 1.45.22 PM.png)

![Screen Shot 2020-03-23 at 5.33.12 PM](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/Screen Shot 2020-03-23 at 5.33.12 PM.png)

Luego de descomprimir los archivos en su lugar, se procede a moverlos a la raíz de /u02

- Se crea el enlace con hdc de propietario en /usr/local

![ls](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/ls.png)

- Se agregan las direcciones de hadoop y jdk al PATH

  (También agregué un alias para 'hdfs dfs')

   ![path](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/path.png)

- Se configura la ip en el archivo hosts y se agrega el hostname definido

![ip](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/ip.png)

- Se configura el ssh

![Screen Shot 2020-03-13 at 1.26.22 PM](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/Screen Shot 2020-03-13 at 1.26.22 PM.png)

- Se agrega hdc a la lista de usuarios *sudoers*

![sudoers](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/sudoers.png)

## Archivos de configuración

![core-site](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/core-site.png)

![mapred-site](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/mapred-site.png)

![hdfs-site](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/hdfs-site.png)

![yarn-site](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/yarn-site.png)

![slaves](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/slaves.png)

## Preparando sistema de archivos

- Siendo propietario de /u01, se procede a formatearlo con hdfs

![format1](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/format1.png)

![format2](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/format2.png)

## Iniciar servicios

![start-all](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/start-all.png)

Se han creado esas dos carpetas en /u01

![format3](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/format3.png)

## Colocar un archivo

![copied a file](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/copied a file.png)

## Crear una estructura de archivos

![estructura de archivos](/Users/xtrs84zk/Documents/BigData/Hadoop - evidencias/estructura de archivos.png)



## Mapreduce

![image-20200324140020084](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200324140020084.png)

![image-20200324140114847](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200324140114847.png)


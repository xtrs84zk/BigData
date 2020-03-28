# SQOOP install

## Archivos

- Se descomprime el archivo de sqoop en /u02

```bash
cd /u02/media
tar -xvf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
mv sqoop-1.4.7.bin__hadoop-2.6.0 ../
```

![image-20200327135449451](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200327135449451.png)

- Se crean los enlaces y se toma propiedad

```bash
cd /usr/local
ln -s /u02/sqoop-1.4.7.bin__hadoop-2.6.0/ sqoop
sudo chown -R hdc:hdc sqoop
```

![image-20200327135524218](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200327135524218.png)

## Environment

- Se agregan estas líneas en el .bashrc

```bash
cd ~
vi .bashrc
```

```bash
export SQOOP_HOME=/usr/local/sqoop
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/jre/bin:$JAVA_HOME/bin:$SQOOP_HOME/bin:$PATH
```

![image-20200327135623942](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200327135623942.png)

## Configuración

- Ubicar la plantilla de configuración y crear un archivo a partir

```bash
cd $SQOOP_HOME/conf
cp sqoop-env-template.sh sqoop-env.sh
vi sqoop-env.sh
```

![Screen Shot 2020-03-27 at 1.35.37 PM](/Users/xtrs84zk/Desktop/Screen Shot 2020-03-27 at 1.35.37 PM.png)

- Modificar dos líneas:

```bash
export HADOOP_COMMON_HOME=/usr/local/hadoop
export HADOOP_MAPRED_HOME=/usr/local/hadoop
```

![Screen Shot 2020-03-27 at 1.34.01 PM](/Users/xtrs84zk/Desktop/Screen Shot 2020-03-27 at 1.34.01 PM.png)

- Comprobar

```bash
sqoop-version
```

![image-20200327135858594](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200327135858594.png)
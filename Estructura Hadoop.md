# HR

## Esquema

- Decidí utilizar el esquema de la página :

   http://www.solocodigoweb.com/blog/2019/11/21/taller-sql-consultas-sql-en-oracle-database-19c-usando-oracle-live-sql/

![image-20200327145851555](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200327145851555.png)

- Para crear el esquema de directorios, lo hice desde la máquina anfitrión.

![Screen Shot 2020-03-27 at 2.40.15 PM](/Users/xtrs84zk/Desktop/Screen Shot 2020-03-27 at 2.40.15 PM.png)

- Para crear los archivos, vscode

![Screen Shot 2020-03-27 at 2.39.46 PM](/Users/xtrs84zk/Desktop/Screen Shot 2020-03-27 at 2.39.46 PM.png)

- De ahí, basta arrastrar la carpeta principal al sistema invitado y mover el contenido a /u02

![image-20200327145126896](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200327145126896.png)

- Luego de este paso, se toma propiedad de la carpeta HR y se mete al sistema hadoop con 

```bash
hdfs dfs -put HR /
```

![image-20200327145348236](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200327145348236.png)

- Si todo está correcto, el esquema de HR quedará así:

![image-20200327145429259](/Users/xtrs84zk/Library/Application Support/typora-user-images/image-20200327145429259.png)
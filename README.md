# Lab1_Grupo3_TDB
Laboratorio 1 + 2 desarrollado por el grupo 3 de TDB.
Para la ejecución de la aplicación es necesario contar con las siguientes herramientas y seguir las siguientes instrucciones:

1. Descargar/clonar repositorio en carpeta local.

Backend (-PostgreSQL 12 -Postgis 3.3 -pgAdmin4 -IDE (Intellij) -JDK version 17)

2. Crear nueva base de datos (en puerto 5432) de nombre "tbd-db" en pgAdmin y restaurar con "dump.sql" (../tbd_backend/).

3. Abrir carpeta "Lab1" (../tbd_backend/) desde IDE (Intellij).

4. Configurar credenciales de acceso a base de datos en "application.properties" (tbd_backend/Lab1/src/main/resources/).

5. Iniciar ejecución de backend desde "Lab1Application.java"

Frontend (-Vue 2.7.10 -Nuxt 2.15.8 -Visual Studio Code)

6. Abrir consola/terminal y situarse en la carpeta tbd_frontend para ejecutar el comando "npm install".

7. Finalmente, se ejecuta el comando "npm run dev", que levanta la aplicación web en el puerto "http://localhost:3000/".

Para testear las funcionalidades principales es necesario registrarse y logearse con las credenciales ingresadas, o situarse desde el navegador en "http://localhost:3000/tareas".

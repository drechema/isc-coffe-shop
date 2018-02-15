README:

Implementation of the REST API of CoffeShop

CONFIGURATION:

1. Creation of the Database
Configuration >> System Configuration >> Local databases
- Create New Database
- Name: COFFESHOP
- Directory: C:\InterSystems\Cache\mgr\COFFESHOP
- Create the resource:% DB_COFFESHOP

2. Creation of Namespace
Configuration >> System Configuration >> Namespaces
- Create New Namespace
- Name: COFFESHOP
- Globals Databases: COFFESHOP
- Routine Databases: COFFESHOP
- Create Web application by default: NO

3. Creation of the Web Application for API-REST services
Security >> Applications >> Web Applications
- Create new web application
- Name: /csp/coffeshop/api
- Namespace: COFFESHOP
- Send Class: coffeshop.api.Service
- Save
- Assign Application Role:% DB_COFFESHOP

4. Creation of the Web Application for the App
Security >> Applications >> Web Applications
- Create new web application
- Name: /csp/coffeshop/app
- Namespace: COFFESHOP
- Physical path of CSP files:
- <Path to choose by the user where the html, css and js files reside>
- Save

SPANISH ------------------------------------------

Implementación de la API REST de CoffeShop

CONFIGURACIÓN:

1. Creación de la Base de Datos
Configuración >> Configuración de Sistema >> Bases de datos locales
- Crear Nueva Base de datos
- Nombre: COFFESHOP
- Directorio: C:\InterSystems\Cache\mgr\COFFESHOP
- Crear el recurso: %DB_COFFESHOP

2. Creación del Namespace
Configuración >> Configuración de Sistema >> Namespaces
- Crear Nuevo Namespace
- Nombre: COFFESHOP
- Bases de Datos Globals: COFFESHOP
- Bases de Datos Rutinas: COFFESHOP
- Crear aplicación Web por defecto: NO

3. Creación de la Aplicación Web para los servicios API-REST
Seguridad >> Aplicaciones >> Aplicaciones Web
- Crear nueva aplicación web
- Nombre: /csp/coffeshop/api
- Namespace: COFFESHOP
- Enviar Clase: coffeshop.api.Servicio
- Guardar
- Asignar Rol de Aplicación: %DB_COFFESHOP

4. Creación de la Aplicación Web para la App
Seguridad >> Aplicaciones >> Aplicaciones Web
- Crear nueva aplicación web
- Nombre: /csp/coffeshop/app
- Namespace: COFFESHOP
- Ruta física de ficheros CSP: 
- <Ruta a elegir por el usuario donde residan los ficheros html, css y js>
- Guardar

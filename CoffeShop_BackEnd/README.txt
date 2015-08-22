README:
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

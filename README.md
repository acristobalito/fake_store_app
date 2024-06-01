# Aplicación e-commerce

Desarrollado en Flutter empleando POO, Provider para la gestion de estados y navigator.  

El presente proyecto consume 2 paquetes publicados en GitHub:  
* [ecommerce_widgets_package](https://github.com/acristobalito/ecommerce_widgets_package), empleado para el desarrollo de interfaces de la aplicación
* [fake_api_source_package](https://github.com/acristobalito/fake_api_source_package), empleado para el consumo de la API [FakeStoreApi](https://fakestoreapi.com/)
  
En esta primera fase no se cuenta con test unitarios

# Tabla de contenidos
1. [Introducción](#introduction)
2. [Agradecimientos](#thanks)
3. [Requerimientos](#requeriments)
4. [Documentación](#doc)
5. [Librerias](#libraries)
6. [Equipo de trabajo](#team)
7. [Conclusiones](#end) 

## Introducción
El proyecto desarrollado para dispisitivos móviles Android e iOS trata sobre una tienda online llamada Fake Store, el cual posee 8 vistas interesantes.  
Cuenta con funcionalidades interesantes como registrar un nuevo usuario, una funcionalidad de loggin, ver el catalogo de productos, filtrar por categorias, buscar por nombre del producto, ver el detalle del producto, agregar producto al carrito, y editar productos del carrito.  
El proyecto esta desarrollado aplicando principios de arquitectura limpia y codigo limpio, se emplea adicionalmente un sistema de diseño basado en Atomic Design.  
  
Para esta primera version se cuenta con las funcionalidades basicas de una aplicación e-commerce y esta abierta a seguir escalando debido a la arquitectura empleada en el proyecto.

## Agradecimientos
Es indispensable agradecer al equipo de talent pool, quienes aportaron brindando ideas y soluciones a diferentes retos presentados en el proyecto.

## Requerimientos
Para descargar el repositorio se requiere VSCode, AndroidStudio o cualquier editor de codigo que les facilite la lectura, compresión y compilación del proyecto.
Para compilar para iOS se requiere contar con una Mac junto a la ultima version de XCode.
Se requiere la version mínima de flutter `3.22.0`.

## Documentación
A continuación se menciona las 3 pantallas de la aplicación:  
+ __Vista de carga (Pantalla principal):__
  En esta vista principal observaremos una bienvenida con 2 opciones para acceder a la app, loggeandose con una cuenta existente, o registrandose.
    
  **Nota:**  Para acceder a la app se recomienda ingresar con los siguientes accesos:
  * Usuario: `mor_2314`
  * Password: `83r5^_`
    
  La API de registro, no permite logear con las credenciales registradas.
    
+ __Vista de loggeo:__
		En esta pantalla podremos encontrar dos cajas de texto y un botón de ingreso.  
  * Botón Ingresar: Al interactuar con este botón, si los campos no han sido ingresados, se mostrara una alerta en las cajas de texto indicando que estan vacíos, en caso de que no esten vacíos, se consumira la API de logeo, si en caso la API responde satisfactorio, se mostrara la pantalla principal de la apliación.
      
+ __Vista de registro:__
		En esta pantalla podremos encontrar un formulario que contiene una validación de campos vacíos, y un botón de registro. Al interactuar con este botón, consumiremos la API de registro mediante el cual enviaremos la información ingresada para el registro. Es importante resaltar que el servicio por alguna razón no recibe las credenciales creadas en esta vista para el loggeo. Para acceder a la app se recomienda loggearte con las credenciales brindadas previamente.

+ __Vista principal:__ En esta pantalla observaremos inicialmente una pagina de inicio, y una barra de navegación en la parte inferior de la pantalla. Adicionalmente, en la barra superior encontraremos una barra de busqueda y un icono de carrito junto a la cantidad de productos agregados al carrito.
    * __Página inicio:__ En esta página encontraremos dos banners que represetan la inaguración de la tienda y los descuentos correspondientes, (los cuales aun no cuentan con una navegación momentaneamente). Adicional a ello contamos con dos carruseles de productos, los cuales muestran como maximo 5 items por cara carrusel. Finalmente, contamos con un botón flotante el cual redirge a la vista de soporte y contacto.
    * __Página catálogo:__ En esta página veremos una lista de todos los productos, junto a una lista desplegable de categorias por las cuales filtrar. Si se selecciona la categoria todas, se muestra todos los productos de la API.
+ __Vista de busqueda:__ A esta vista se acccede al dar tap sobre la barra de busqueda la cual se encuentra en la página de catálogos, en esta vista de igual manera encontraremos una lista de todos los productos, junto a una barra de busqueda la cual con cada entrada de texto se realiza y filtra los productos coincidentes.
+ __Vista de detalle del producto:__ En esta vista observaremos todos los detalles del producto seleccionado, y un boton con el texto `Agregar producto`, el cual servira para añadir al carrito el producto. Si encuentra el producto en el carrito, el texto del botón cambia a `Agregar otro producto`.
+ __Vista del carrito:__ En esta vista veremos un listado con todos los productos agregados previamente, y un control de unidades junto a un boton eliminar producto. Cuando se ajusta las unidades de los productos del carrito, y se regresa a las vistas previas, estas unidades se veran reflejadas en el texto del icono del carrito. Observaremos adicionalmente una sección de **Total** el cual calcula el precio por unidades de cada producto. Finalmente un boton de **comprar**, el cual por temas académicos elimina toda la lista de productos del carrito y muestra un toast de agradecimiento por la compra.
+ __Vista barra lateral:__ A esta vista accederemos al dar Tap al icono ubicado en la parte superior izquierda de la pantalla principal, al desplegarse este menú lateral encontraremos 2 opciones: `Soporte y contacto` y `Cerrar sesión`.
	* __Soporte y contacto:__ En esta vista encontraremos la información del desarrollador junto a sus medios de contacto.
 	* __Cerrar sesión:__ Al interactuar con esta opciones, retornaremos a la vista del splash cerrando todas las vistas previas.

**NOTA:** Los productos que se añaden al carrito, se almancenan en el dispositivo empleando la libreria de SharedPreferences codificando el objeto a una cadena de texto, y para leer la información decodificamos el string al modelo del carrito. El modelo empleado en el carrito es `List<CartAppModel>`.  

 ## Librerias
 A continuación se comparte las librerias empleadas:  
 * [ecommerce_widgets_package](https://github.com/acristobalito/ecommerce_widgets_package)
 * [fake_api_source_package](https://github.com/acristobalito/fake_api_source_package)
 * [shared_preferences](https://pub.dev/packages/shared_preferences)
 * [provider](https://pub.dev/packages/provider)  

 ## Equipo de trabajo
 Su servidor Antony Raul Cristobal Zambrano desde Perú 🇵🇪

 ## Conclusiones
 Al desarrollar el presente proyecto se logro conocer los conceptos basicos de widgets, gestion de estado y navegación necesarios para enfrentar proyectos reales. Se logro adicionalmente poner en practica diferentes conocimientos obtenidos hasta la fecha para desarrollar este pequeño proyecto.
 Espero que este proyecto cumpla con sus expectativas y sirva como referencia para otros colegas que se adentran en el mundo de Flutter 🩵.

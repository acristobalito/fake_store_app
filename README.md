# Aplicación e-commerce

Un pequeño proyecto desarrollado en Flutter empleando POO, Provider para la gestion de estados y navigator.  

El presente proyecto consume 2 paquetes publicados en GitHub:  
* [ecommerce_widgets_package](https://github.com/acristobalito/ecommerce_widgets_package), empleado para el desarrollo de interfaces de la aplicación
* [fake_api_source_package](https://github.com/acristobalito/fake_api_source_package), empleado para el consumo de la API [FakeStoreApi](https://fakestoreapi.com/)

El proyecto esta enfocado en la plataforma movil con soporte a ambos SO (Android y iOS), el cual contienen un CRUD basado en el videojuego de antaño Dragon City.  
  
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
+ Vista de carga (Pantalla principal):
  En esta vista principal observaremos una bienvenida con 2 opciones para acceder a la app, loggeandose con una cuenta existente, o registrandose.
    
  **Nota:**  Para acceder a la app se recomienda ingresar con los siguientes accesos:
  * Usuario: `mor_2314`
  * Password: `83r5^_`
    
  La API de registro, no permite logear con las credenciales registradas.
    
+ Vista de loggeo:
		En esta pantalla podremos encontrar dos cajas de texto y un botón de ingreso.  
  * Botón Ingresar: Al interactuar con este botón, si los campos no han sido ingresados, se mostrara una alerta en las cajas de texto indicando que estan vacíos, en caso de que no esten vacíos, se consumira la API de logeo, si en caso la API responde satisfactorio, se mostrara la pantalla principal de la apliación.
      
+ Vista de registro:
		En esta pantalla podremos encontrar un formulario que contiene una validación de campos vacíos, y un botón de registro. Al interactuar con este botón, consumiremos la API de registro mediante el cual enviaremos la información ingresada para el registro. Es importante resaltar que el servicio por alguna razón no recibe las credenciales creadas en esta vista para el loggeo. Para acceder a la app se recomienda loggearte con las credenciales brindadas previamente.

+ Vista principal:
    * Página inicio
    * Página catálogo
+ Vista de busqueda:
+ Vista de soporte y contacto:
+ Vista de detalle del producto
+ Vista del carrito

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

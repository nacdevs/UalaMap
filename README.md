## UalaMap

##### App demo swiftUI, busqueda y mapa


#### Features

- Toda la informacion esta compartida por Bindings y guardada en States.
- La busqueda se resovio realizando una Task para realizarla en paralelo y despues actualizar la UI.
- Los favoritos se almacenan en UserDefaults utilizando el "id" como key. (SwiftData o CoreData hubiese sido un overkill).
- Para agregar o eliminar un favorito se realiza swipe sobre la fila que lo contiene.
- Se realizo un layout aparte para el modo landscape y como toda la informacion viaja por bindings no hubo que agregar nada en particular para poder compartir la informacion entre vistas en una misma pantalla. 
- Arquitectura MVVM.
- UnitTest con Mocks (no hay gran uso en este caso pero su finalidad es brindar flexibilidad y confianza a los test, mas que nada en CI) y Expectations (para func async).

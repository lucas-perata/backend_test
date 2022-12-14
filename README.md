# API INCREASE BACKEND

## Utilizar la versión en Heroku

- https://fathomless-caverns-50562.herokuapp.com/api-docs/index.html

Desde ese link se pueden probar los endpoints de la API.

## Clonar repositorio

- Primer paso: git clone
- Segundo paso: cd a la carpeta
- Tercer paso: rails db:create y rails db:migrate
- Cuarto paso: rails s

### Versiones

- Ruby 3.0.3
- Rails 7.0.3.1

## Endpoints y tests para repositorio clonado

Dejo especificados los endpoints levantando un server localhost:3000. Además dejo los comandos para correr los tests.

### Endpoints

- http://localhost:3000/api/v1/load/: Realiza la request a la API de INCREASE y filtra la información.
- http://localhost:3000/api/v1/clients/ : Todos los clientes.
- http://localhost:3000/api/v1/clients/:id/ : Transacciones de un solo cliente.
- http://localhost:3000/api/v1/clients/:id/payments : Fecha de pago y monto que le corresponde a un cliente en particular.

### Tests

- Test modelos: rails spec:models
- Test controllers: rails spec:requests

## Decisiones y proceso

Cuando comencé este proyecto me sentí totalmente intimiadado por las miles de lineas del file.txt, ya que nunca me había enfrentado a algo similar. Aunque me cueste admitirlo, tardé unos días en poder entender exactamente lo que tenía que hacer. Comencé realizando diagramas y pseudocódigo para luego crear la función que filtrara la información por tablas sin distinción del tipo de dato.

Luego me di cuenta que sería más eficiente filtrar desde la última línea, el footer, ya que otorga el Client Id. Cuando logré crear el algoritmo capaz de leer de abajo hacia arriba, tan solo tuve que crear los métodos y poner la API en funcionamiento.

Otra de las dificultades que encontré fue que la API de Increase no permite realizar las cientos de request necesarias para obtener toda la información de los clientes. Por lo que tuve que programar la función de manera tal que deje de ejecutarse luego de X intentos. En este caso opté por tomar la información que provee que serían unos 19 clients sin dar error. La alternativa era solo tomar los ID de los clients y construir la tabla sin información personal. De esta manera, la API no daba error 500 porque solo se hacia una request del file.txt.

Utilicé sleeps en el código también para obtener la mayor cantidad de info posible sin que diera error. Se sacrifica el rendimiento pero se gana en funcionalidad. Luego implementé algunos tests básicos de los modelos y de las requests de acuerdo me alcanzó el tiempo.

### Gemas utilizadas

- Swagger: para documentar los endpoints fácilmente.
- Rubocop: para mantener el código organizado y respetando las buenas prácticas del lenguaje.
- Figaro: para guardar la KEY de la API de Increase. Sin embargo, opté por no utilizarla para facilitar el proceso de clonado para probar la API en local.
- HTTParty: para realizar la comunicación con la API de Increase. Elegí esta entre otras gems debido a que se mantiene actualizada.
- JSON API serializer: para manipular la información que muestra la API en formato JSON. Aunque no lo utilicé en la versión final.
- Pry: para debuggear con mayor facilidad.
- PG: de esta manera la base de datos es compatible con servicios como el de Heroku.
- FactoryBot: para realizar tests.

## Mejoras

- Agregar FRONTEND con views en RoR o una librería externa como React.js. Así aumentaría la accesibilidad a la API.
- Mejorar y optimizar el código así como las relaciones en la base de datos además de extender los tests para cubrir todos los errores posibles. Testing de relaciones en DB con la GEM shoulda-matchers. No seguí TDD estrictamente por la limitación de tiempo.
- Autentificación basada en JWT. Había pensado en agregarle, pero lo dejé de lado por una cuestión de tiempo y porque la API de Increase ya contaba con un método para autentificar los pedidos.
- Mejorar el manejo de errores debido a que la API provista por Increase(https://increase-transactions.herokuapp.com/) falla luego de múltiples pedidos para obtener la información de los clientes. Por el momento dejé un sistema basado en cantidad de veces en que responde con código 500 para que no continúe intentando y pueda cerrar el proceso.
- Agregar GRAPHQL para mejorar las request a la API.
- Automatizar los pedidos a la API. Implementar una función que cada 10 minutos realice un pedido así llena la DB con la información. Junto con esto se puede implementar una función que analice si el documento es exactamente el mismo para evitar duplicaciones.
  -Revisar los tipos de datos que utilicé en la DB.

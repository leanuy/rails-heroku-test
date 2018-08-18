Guia para hacer deploy de una webapp rails en heroku

Antes de clonar, verificar se tiene la version de ruby 2.5 y la version 5.x de rails
(en consola correr ruby -v y rails -v)

En esta guia suponemos que estan instaladas las dependencias solicitadas por rails (node, bundle, postgreSQL. etc)

Clonarse el repositorio. Luego correr bundle install en la carpeta el proyecto.

Hacer el setup de la base de datos y la migracion. Correr rake db:setup y rails db:migrate (Investigar si se tienen errores en como usar postgres con rails)

En este punto correr rails server y ver localmente la app.

Para hacer el deploy en heroku, loguearse con heroku login, hacer heroku create. Luego:
git add .
git commit -m "Initial commit"
git push heroku master

Luego se debe setear la base de datos en el sevidor:
heroku run rake db:setup
heroku rake db:migrate

Para refrescar hacer heroku restart

Ir a la url indicada luego del push de heroku y verificar si la web app esta funcionando.

Cualquier error consultar la siguiente documentacion: https://devcenter.heroku.com/articles/getting-started-with-rails5

Para ver el ejemplo corriendo en heroku entrar a 
http://polar-scrubland-46250.herokuapp.com/

IMPORTANTEEEE!!! crear la APP con PostgreSQL como base de datos sino despues hay que configurar a mano para que ande en heroku(prefieren postgres)
Se hace como sigue rails new project-name-here --database=postgresql

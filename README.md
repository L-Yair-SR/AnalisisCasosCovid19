# AnalisisCasosCovid19

## Descricpión

Este proyecto se compone de la realización de una Base de datos a partir de datos recuperados de la secretaria de salud sobre casos de Covid-19 registrados en el pais y el analisis de los datos de una vista generada a partir de la misma base de datos mediante el algoritmo KMeans y el programa WEKA.

## Base de datos

Este es el modelo ER de la base de datos creada apartir de la informacion obtenida.

![BasedeDatos](Img/Covid19premier.png)

## Analisis de datos

Para el analisis de los datos se ocupo el algoritmo KMeans el cual nos permite el agrupamiento y procesamiento de la informacion a partir de clusters.
La vista que ocupamos contiene los atributos de: Edad, Sexo, EntidadResidencia, Diabetes, Obesidad y Tabaquismo, ocupando 4 clusters para su calsificación lo cual nos da lo siguiente:

![DistribuciondelosClusters](Img/4clusters.png)

En la siguiente grafica podemos ver los datos *(en el eje horizontal)* contra la edad *(en el eje vertical)* y se aprecia que todavia se cuenta con mucha disperción en los datos ya que los clusters de la edad no estan tan distantes entre ellos.

![GraficaEdadDatos](Img/GraficaEdadDatos.png)

Sin embargo si ponemos los datos *(en el eje horizontal)* contra la EntidadResidencia *(en el eje vertical)* podemos notar una mejor separacion de los datos ya que los clusters si cuentan con una mayor separacion entre ellos, se puede observar que dos cluster estan entre los estados 1 y 17 mientras que otros dos clusters estan entre los estados 18 a 32.

![GraficoEResidenciaDatos](Img/ENDatos.png)

Tomando los datos contra el sexo podemos como dos clusters se van hacia el sexo masculino y dos clusters se van hacia el sexo femenino. Con todo esto ya podemos ir agrupando nuestros datos para poder seleccionarlos de la base de datos y poder conocer mas informacion sobre los mismos.

![GraficoSexoDatos](Img/SexoDatos.png)
![QuerydeSeleccion](Img/Query1.png)
![QuerydeSeleccion](Img/Query2.png)

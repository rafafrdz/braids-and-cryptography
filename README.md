# Trenzas y Criptografía

_Trabajo de Fin de Grado realizado por Rafael Fernández Ortiz, estudiante del grado de Matemáticas de la Facultad de Ciencias de la Universidad de Málaga._

*El trabajo Trenzas y Criptografía tiene como objeto el estudio de la relación que existe entre las trenzas y los grupo de Artin, el problema de la palabra, el problema de la conjugación y sus aplicaciones en el campo de la criptografía.*

## Resumen <img src="https://img.icons8.com/color/48/000000/literature.png">

Comenzaremos dando una introducción a la teoría de trenzas, tanto desde un punto de vista geométrico como algebráico. Para ello, previamente se repasará definiciones y resultados en la teoría de grupos libres y grupos simétricos. Presentaremos el grupo de Artin y sus generadores como presentación de grupo y sus elementos, respectivamente.

Tras esto, desarrollaremos, desde un enfoque geométrico, la idea de trenza, sus diagramas, como interactuan entre sí y algunos resultados sumamente importantes que establecerán una relación esencial entre el los grupos de trenzas y el grupo de Artin. De esta forma, podremos trabajar con las trenzas desde una visión geométrica o una visión algebraica según convenga.

Trataremos en detalle el *problema de la palabra* y el *problema de la conjugación*, problemas fundamentales que los grupos de trenzas presentan y que han derivado, como aplicación en la criptografía, en sistemas de intercambio de claves originados por variaciones del esquema propuesto por *Diffie-Helman*.

Por ultimo, trataremos de definir una solución o establecer un método para la resolución del problema de la conjugación como posible ataque frente al sistema criptográfico basado en trenzas. Así, pondremos en juicio la seguridad que dicho sistema establece.

Para el desarrollo de los cálculos entre trenzas utilizaremos un software de computación algebraico, *SageMath*, que nos resultará esencial para poner a prueba los métodos propuestos y realizar distintos *benchmarks*, es decir, pruebas de rendimientos.

## Comenzando 🚀

Toda la teoría requerida se desarrolla en el PDF *Trenzas y Criptografía*.


### Pre-requisitos 📋

Para lidiar con los problemas prácticos que se expone en el trabajo, se requiere tener instalado el software *SageMath*. 

​	SageMath que es un *sistema de computación algebraica* escrito en Python, C, entre otros; y que nos ayudará a realizar las operaciones con trenzas, ayuda que realmente nos será de mucha utilidad pues vamos a considerar parámetros relativamente altos y nos expondremos a una situación compleja a nivel práctico.

La documentación de SageMath orientada a la computación de trenzas la podemos encontrar [aquí](http://doc.sagemath.org/html/en/reference/groups/sage/groups/braid.html).

### Instalación de Sage 🔧

_Para la insalación, debemos acceder a la [página oficial de SageMath](http://www.sagemath.org/index.html)_ y proceder según nuestro sistema operativo.

#### Microsoft Windows

Es tan sencillo como descargar la última versión del ejecutable .exe de instalación

Enlace: http://ftp.rediris.es/mirror/sagemath/win/index.html

#### Linux - Ubuntu y/o basadas en Debian

Para la distribución de linux Ubuntu y otras distros basadas en Debian, es tan sencillo como escribir en la terminal lo siguiente:

```bash
$ sudo apt-get install sagemath
```

## Scripts Sage ⚙️

Sage tienen la peculiaridad de que interpreta usando la versión de python 2.7. Sin embargo, entiende e interpreta los scripts escritos en las últimas versiones, por lo que, tanto para los acostumbrados a la versión más clásica como a los de las nuevas versiones, no tendrán ningun tipo de inconveniente en el uso de esta herramienta.

Los scripts .sage exupuestos en este repositorio, que son los expuestos en el pdf, están escritos en Python v3.7

### Ejecución de scripts :computer:

#### Microsoft Windows

Ejecutamos el programa *SageMath* que nos aparece tras la instalación. Una vez en la terminal que nos muestra, escribimos

```python
load("path\file.sage")
```

Donde *path* es la ubicación del archivo y *file* el nombre. Tambien podemos asociar en Windows, que estos archivos se ejecuten con *SageMath* mediante las opciones de *Abrir con* en *Propiedades*.

#### Linux y Mac

Abrimos la terminal y nos dirigimos a la ubicación donde está alojado el archivo de la siguiente forma

```bash
$ cd path
```

donde *path* es la ubicación. O bien, directamente abrimos la terminal donde esté alogado nuestro script. Una vez localizado el archivo, escribimos en la terminal

```bash
$ sage
```

Se nos abrira el entorno de trabajo de *SageMath*, y ahi escribimos una vez cargada la UI

```python
load("file.sage")
```

donde *file* es el nombre del script.

## Deployment 📦

Este repositorio es libre y gratuito. Su finalidad es puramente académico y está disponible al lector para el uso que lo requiera. Agradecería, en caso de uso, que se tomara referencias del autor y del propio repositorio.

## Construido con 🛠️

* [Sage](http://doc.sagemath.org/html/en/reference/index.html) - El framework
* [Python](https://docs.python.org/3/) - El lenguaje de programación

## Referencias 📖

* C. Kassel y V. Tuarev, *Braid Groups*. Editorial Board, 2008.
*  F.A. Garside, *The braid group and other groups*. 1969.
* J.B. Fraleigh, *Álgebra abstracta*. Editorial Addison-Wesley. 1982.
* M. Bennett, *Combinatorial aspects of braids with applications to cryptography*. Universidad de matemáticas de Waterloo, Ontario, Canada. 2015.
* D. Hofheinz y R. Steinwandt, *A practical attack on some braid group based cryptographic primitives*. EA Practical Attack on some Braid Groups Cryptographic Primitivesditorial Desmedt. 2003.
* M.A. Marco Buzunariz, V. Braun, S.F. Jørgensen, R.Lipshitz, T. Monteil y S.Oehms, *Documentación de SageMath, Braid Groups*.
* D. Garber, *Braid group cryptography*. Departamento de matemáticas aplicadas del instituto de tecnologías de Holon, Israel. 2008.
* P. Dehornoy, *Braid-based cryptography*. 2000.
*  H.Delfs y H. Knebl *Introduction to Cryptography. Principles and Applications*. Editorial Springer. 2007
* Moni Naor y Moti Yung, *Publick*key cryptosystems provably secure against chosen ciphertext attacks*. 1990.
* M.I. Gónzalez y R. Steinwandt, *Group Theoretic Cryptography*. Editorial Chapman \& Hall. 2015.
* E. Artin, *Theory of braids*. 1947.
* J. Stillwell, *The word problem and the isomorphism for groups*. 1982.
* E.A. Elrifai y H.R. Morton, *Algorithms for positive braids*. Departamento de matemáticas del King Khalid univerity, Abha, Arabia Saudi. Departamento de matemáticas de la universidad de Liverpool, Peach St, Liverpool, Inglaterra.
* Ki Hyoung Ko, Sang Jin Lee, Jung Hee Cheon, Jae Woo Han, Ju-sung Kang y Choonsik Park, *New public-key cryptosystem using braid groups*. Departamento de matemáticas del instituto de ciencias y tecnologías, Taejon, Korea. Departamento de matemáticas del Brown university, Providence, EEUU. 2000.
* Jae Choon Cha,Ki Hyoung Ko, Sang Jin Lee, Jae Woo Han, Jung Hee Cheon, *An efficient implementation of braid groups*. Departamento de matemáticas del instituto de ciencias y tecnologías, Taejon, Korea. 2001.
* J.L. Chacón, *Permutaciones y grupo simétrico*. Universidad de los Andes, Venezuela.

## Autores ✒️

_Se agradece la reseña o cita del autor, de su trabajo y del propio repositorio en los trabajos a los que haya aportado algo de luz y conocimiento._

**Rafael Fernández Ortiz**.- 	:briefcase: [*LinkedIn*](https://www.linkedin.com/in/rafael-fern%C3%A1ndez-ortiz-7a1684171/) - ​<img src="https://img.icons8.com/color/20/000000/open-envelope.png">​ ​[Gmail](rafaelfernandezortiz@gmail.com) - ​<img src="https://img.icons8.com/color/20/000000/cardboard-box.png">​ [GitHub](https://github.com/rafafrdz) - :bookmark_tabs: [Cv](https://rafafrdz.github.io/) 

## Expresiones de gratitud  y/o sugerencias <img src="https://img.icons8.com/color/48/000000/beer.png">

Siempre es interesante tratar un tema mientras te tomas una cerveza <img src="https://img.icons8.com/color/28/000000/beer.png">
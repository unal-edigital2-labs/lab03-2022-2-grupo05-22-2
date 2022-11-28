# Entrega de proyecto final - Digital 2

En este proyecto se tiene como objetivo el diseño y creación de un sistema de clasificacion de la calidad de agua que se recibe desde un sistema de tuberias convencional como el que nos puede abastecer el nuestros hogares.  Para lograr esta finalidad se implementa una arquitectura RISC y se aplican conceptos en manejo de registros, procesadores, instrucciones del procesador usando como medio de comunicacion entre los modulos y el procesador la herramienta LiTex. A si mismo se aplico la logica necesaria para que entre los mismo perifericos se obtuviera el resultado esperado.




# Autores

* Juan Sebastian Angarita Mejia - juangaritam@unal.edu.co
* Daniel Esteban Cifuentes Martinez - dcifuentes@unal.edu.co
* Hilderman Rodrigo Pedraza Avellaneda - hpedraza@unal.edu.co

# Sistema de Monitoreo para el Control y Calidad del Agua

**Problematica**

El agua, considerada como necesidad básica y derecho fundamental, es el líquido pilar de la vida,
y el desarrollo de la sociedad. Actualmente el acceso global a agua tratada en condiciones aptas para el uso y consumo se ha vuelto un desafió teniendo en cuenta las crecientes problemáticas medioambientales y la falta de infraestructura para la distribución y comercialización del agua en zonas vulnerables.

Centralizándolos en la situación Colombiana, según cifras publicadas por MADS en 2017, el 60%  del agua procedente de las llaves de hogares colombianos no está en condiciones óptimas de potabilización, una consecuencia que contrasta con otros factores como la contaminación de los ríos, la insuficiencia en la cobertura de los sistemas de tratamiento de aguas residuales, el desarrollo de prácticas ilegales como la minería y la falta de conciencia de los ciudadanos[2]. 

Sumado a ello, la brecha entre el acceso al agua de buena calidad y la falta de infraestructura ha traído consigo numerables consecuencias sanitarias. En Colombia departamentos como Choco, Hulia, Nariño y Bolivar se encuentran en alerta máxima debido a los retos derivados de los parámetros del agua aptos para el consumo humano, donde problemáticas como las enfermedades derivadas del uso de aguas altamente contaminadas son una preocupación creciente que se extiende hasta las zonas vulnerables del territorio nacional.

**Objetivos**

* General

Priorizar el uso del agua en pro de la sanidad en poblaciones vulnerables y el uso adecuado del mismo 

* Específicos

Realizar una correcta selección, configuración y aplicación de sensores pertinentes para la medición de la calidad del agua.

Consultar los rangos de lectura para los cuales el agua pueda ser potable, utilizable o esté totalmente contaminada con el fin de emplear procesos de filtrado y realizar una clasificación adecuada.

Materializar los conceptos correspondientes a la lógica programable y al procesamiento de señales

**Alcance del proyecto**

Se planea construir un prototipo completamente funcional capaz de recolectar información pertinente sobre el estado del agua usada por diferentes poblaciones, para ello se hará uso de diferentes sensores controlados y coordinados por medio de una FPGA, este prototipo será capaz de discernir entre posibles niveles de riesgo con el fin de desviar el caudal hacia distintos procesos de filtrado.

El prototipo final incluirá en conjunto de x sensores, que estarán monitorizando continuamente el agua circulante sobre un pequeño caudal, obteniendo registro de características como: el nivel de agua, temperatura, PH, nivel de cloro, turbieza, entre otros. La FPGA será la central de recepción y control de Datos, esta misma será la encargada de tomar las decisiones con la que un conjunto de servomotores modificase el caudal original encaminando este a un proceso de filtrado específico para ciertas características del líquido.

**Cronograma**

![a1](https://user-images.githubusercontent.com/112178078/204388507-e94f788d-fb14-4fe5-a859-dd0024025c99.png)

Cronograma Actualizado Segundo Avance

![11](https://user-images.githubusercontent.com/112178078/204388504-bdcbe2e3-c537-4e89-b4d1-03b829dc5c1c.png)

**Diagrama de Caja negra**

* Sensores

![1](https://user-images.githubusercontent.com/112178078/204388471-62853c2b-f132-46d2-8d12-70ecb90b8b07.png)

* Accionamineto

![2](https://user-images.githubusercontent.com/112178078/204388473-ca133c8c-ec28-4ca2-97b4-6733a25834f2.png)


* Estructura General

![3](https://user-images.githubusercontent.com/112178078/204388474-7a203701-4d90-431e-b32e-775c32f7ce6c.png)

**Dificultades**
    
* A lo largo del desarrollo del proyecto se han venido presentando diferentes inconvenientes que han afectado el progreso del mismo, a continuación, se listan algunos de ellos.
* En la recolección de datos y parámetros ajustados al contexto en el que se plantea el despliegue del proyecto.   

* Al momento de unificar la configuración de los sensores utilizados para el tratamiento de los datos recolectados   

**Sistema Final**
**Perifericios**

* Sensor de alcohol:

![13](https://user-images.githubusercontent.com/112178078/204392920-c05cd5a2-4e83-40fa-b382-1c44966c90fa.png)

El sensor de alcohol con referencia MQ3 cuenta con 4 pines, uno de VCC, uno de GND y 2 de datos, para transmision Analoga y transmision digital, en este casos se cuenta con una facilidad de operacion del dispositivo puesto que la entrada digital unicamente identifica si hay presencia de alcohol o no, si necesitamos modular la cantidad de alcohol se hace directamente en el sensor con un potenciometro que trae integrado, basicamente se modula la sensibilidad del dispositvo.

Por esto el codigo implementado en verilog que despues se pasa como un diagrama de caja negra a LiTex para unificarlo y su posterior creacion del espacio de memoria.

```
module MQ3(
  input         Alcohol_ent,                        
  output        Alcohol_sal
  );          

assign Alcohol_sal=Alcohol_ent;
endmodule
```
* Sensor de nivel de agua:

![7](https://user-images.githubusercontent.com/112178078/204388488-4a250492-abc9-467b-be59-acfdeefbbc4e.png)

* Sensor de temperatura:

![8](https://user-images.githubusercontent.com/112178078/204388494-a187346a-c3c6-4c15-8330-bc8679dae6e3.png)
* Valvula:
![12](https://user-images.githubusercontent.com/112178078/204396275-16e752d4-d1a8-45b1-9c20-2070cd2900cb.png)

* Modulo Wi-Fi:

![6](https://user-images.githubusercontent.com/112178078/204388485-83c42d82-8bb1-4976-bc5a-2069057a27a3.png)
* Servomotor:

![4](https://user-images.githubusercontent.com/112178078/204388475-a31bbb1a-ab1c-4043-8836-6a5507289978.png)

* Arduino
* Se involucró el uso de arduino como parte de la lectura del sensor de nivel de agua, este sensor tiene como salida una señal análoga, por lo que se implementó la placa para recibir los datos análogos y convertir los datos en una salida digital.

```
#define sensorPower 7
#define sensorPin A0
#define salidalevel 10
float sensorValue;  //variable to store sensor value
// Value for storing water level
// Value for storing water level
int val = 0;

void setup() {
  // Set D7 as an OUTPUT
  pinMode(sensorPower, OUTPUT);
  pinMode(salidalevel,OUTPUT);  
  // Set to LOW so no power flows through the sensor
  digitalWrite(sensorPower, LOW);
  // Iniciamos la comunicación serie
  Serial.begin(9600);
}
```

En el entorno Arduino IDE se declara una entrada análoga de la placa que va conectada directamente al sensor y un pin para alimentarlo, así mismo la salida digital corresponderá a un valor lógico de estado 0 o 1 que indica la presencia o no de agua. (esta salida va conectada a un pin de entrada en la FPGA para su integración con el procesador).

A continuación se muestra en código el proceso y la función para realizar la correcta lectura del sensor, donde con el uso de condicionales se declara el estado de salida.
```
void loop() {
  delay(1000);
  
  int level = readSensor();
	
	Serial.print("Water level: ");
	Serial.println(level);
	delay(1000);

  if (level>200){

     Serial.println("1");
     digitalWrite(salidalevel, LOW);
  }
  else {

   Serial.println("0");
   digitalWrite(salidalevel, HIGH);
  }
}

int readSensor() {
	digitalWrite(sensorPower, HIGH);	// Turn the sensor ON
	delay(10);							// wait 10 milliseconds
	val = analogRead(sensorPin);		// Read the analog value form sensor
	digitalWrite(sensorPower, LOW);		// Turn the sensor OFF
	return val;							// send current reading
}
```

![5](https://user-images.githubusercontent.com/112178078/204388480-43ef72cd-152f-4e69-9db3-4ddac95de076.png)

**Funcionamiento**

El sistema esta compuesto por 3 etapas principales, etapa de sensado, etapa de paso y etapa de distribución, en la primera se encuentran los sensores de nivel de agua y cloro, el primero se encarga de iniciar el sistema, detectando el ingreso de agua al mismo y dando la orden de inicio de sensado al sensor MQ3, este por su parte se encarga de verificar la calidad del agua que ingresa al sistema y es utilizado como señal de control para la etapa de distribución. La etapa de de paso consiste en una válvula electrónica, que detecta el ingreso de agua al sistema y la finalización del sensado para dar paso o no al líquido, finalmente encontramos la etapa de distribución donde se encuentra nuestro servomotor, el encargado de desviar el caudal dependiendo la calidad del agua ingresada.

**Lógica**


![ss1](https://user-images.githubusercontent.com/112178078/204388595-a7334908-de1c-40db-9ab5-854b0b2e9a8e.png)

De la imagen anterior se puede realizar la descripción de funcionamiento general del proyecto puesto en práctica, inicialmente se va a tener la señal proveniente del sensor de nivel de agua para saber únicamente si tenemos presencia o no de agua en el sistema, si no lo tiene no sucede nada, la válvula que es normalmente cerrada no se abre y el servomotor no presenta cambios en la dirección del caudal. Caso contrario donde si se tenga una señal de nivel de agua se pasa a la segunda comprobación que proviene del sensor de alcohol.

Dado que la válvula es normalmente cerrada va a retener el líquido hasta que el sensor mande una señal indicando la presencia de componentes contaminantes o en caso contrario la no presencia de estos, si detecta algún cambio en el nivel de alcohol automáticamente se realiza el cambio de caudal por medio del servomotor que va adherido a una manguera flexible realiza el cambio de caudal, esto va a suceder únicamente mientras el sensor este detectando alcohol, en el momento que el sensor deje la presencia de alcohol todo va a ser reseteado a su estado inicial donde espera la presencia de agua.

Este proceso se recibe constantemente mientras los sensores y el procesador se encuentren encendidos.

![f1](https://user-images.githubusercontent.com/112178078/204388517-6d1e2d6f-72b3-4c16-b39e-ea090869cafb.png)

**Prototipo**
Para el montaje del prototipo realizamos la construcción del sistema utilizando tubos de pvc tanto para los canales como para la base.
Sobre el canal principal podemos encontrar en primer lugar el sensor de nivel de agua, encargado de activar el sistema, el sensor MQ3 se localiza unos centímetros más adelante sobrepuesto a una altura de 1.5 cm del flujo de agua, a continuación encontramos la válvula solenoide   y el servo motor, este último se encuentra conectado a una manguera pvc flexible que permite el movimiento para la selección del proceso de filtrado, junto a la base se encuentra el centro de control del sistema, constituido por la FPGA Nexys A7 y el Arduino uno, el centro de control se encuentra construido sobre una repisa de madera y una cubierta de acrílico la cual protege los circuitos de cualquier riego o goteo que se pueda presentar .

*
![b1](https://user-images.githubusercontent.com/112178078/204388509-1fc678fc-0a95-4970-a1ed-57ae7ab81c42.jpeg)

*
![c1](https://user-images.githubusercontent.com/112178078/204388510-e3bb15fd-7d32-4aa2-96bc-112b25b69962.jpeg)

*
![d1](https://user-images.githubusercontent.com/112178078/204388511-211d7f9e-40f3-4c5b-b6e1-0c0b3cda7df4.jpeg)

*
![e1](https://user-images.githubusercontent.com/112178078/204388514-178040ae-3f75-4b49-815e-8c91047bdd18.jpeg)

* 
![g1](https://user-images.githubusercontent.com/112178078/204388463-e6838601-2e54-462f-90d4-63c28de3cdb4.jpg)

**Diagrama de costos**

![ss2](https://user-images.githubusercontent.com/112178078/204388470-84eb3b5a-eba6-4afa-9cab-515c14d54847.png)

**Conclusiones**
* Los procesadores montados en un SoC, permiten el manejo completo de los periféricos que se desean utilizar para una tarea especifica, teniendo la posibilidad de aprovechar de mejor manera la memoria en caso de no requerir el uso completo del entorno como en el caso de la FPGA.
* Se puede implementar un sistema de clasificación de las aguas que llegan a los hogares sin necesidad de realizar una gran inversión a cambio de la seguridad sanitaria en nuestros hogares. 
* El uso del procesador V-RISC a pesar de usar tan solo 32 Bits permite realizar tareas de gran complejidad, representando así una solución relativamente sencilla de aplicar para la automatización de diferentes procesos.

En el siguiente enlace encontrara un video donde se muestra el funcionamiento del sistema 
https://drive.google.com/file/d/1N4E0cGGnrKqgZ_WLJ2FaIIsMoniUIFt3/view?usp=share_link

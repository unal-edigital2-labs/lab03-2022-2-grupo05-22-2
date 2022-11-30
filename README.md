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

El sensor de nivel de agua es un periferico analogo, para poder usarlo es necesario el uso de un ADC, en este caso se pudo usar un un convertidor ADC de 4 bits, para lo cual usariamos el siguiente codigo en VHDL:
```
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity water_level_indicator is
port(
	a0 : in std_logic;
	a1 : in std_logic;
	a2 : in std_logic;
	a3 : in std_logic;
	a4 : in std_logic;
	a : out std_logic;
	b : out std_logic;
	c : out std_logic;
	d : out std_logic;
	e : out std_logic;
	f : out std_logic;
	g : out std_logic
		);	
end water_level_indicator;

architecture Behavioral of water_level_indicator is

begin
	a <= a4 or ( ( not a3) and a1 );
	b <= not a4;
	c <= a2 or ( not a1 );  
	d <= a4 or ( ( not a3) and a1 );
	e <= a1 and ( not a2 );
	f <= a3;
	g <= a1;
end Behavioral;
```
Sin embargo este codigo es funcional principalmente para la deteccion de niveles de humedad, para nuestro caso unicamente necesitabamos saber si habia una entrada de agua o no, para lo que se usa una entrada de unicamente 2 bits, estos se traen directamente de el ADC integrado en arduino y detectan el nivel en el que haya presencia de agua o no, con esto se tiene la senal sensible necesaria, el codigo implementado fue:
```
module Nivel_agua(
  input        clk,
  input       Ent_nivel0, 
  input       Ent_nivel1,                      
  output   Sal_nivel1,
  output   Sal_nivel_temp
  );          

reg [20:0]contador=0;
reg [1:0]Sal_nivel=0;

always@(posedge clk)begin
	contador = contador + 1;
	if(contador =='d1_000) begin
	   contador = 0;
	end

	case({Ent_nivel1, Ent_nivel0})
        2'b00:  Sal_nivel = 2'b00;
        
        2'b01:  Sal_nivel = 2'b10;
        
        2'b10:  Sal_nivel = 2'b01;
        
        2'b11:  Sal_nivel = 2'b11;
        
        default:Sal_nivel= 2'b00;
    endcase
 end
 
 assign Sal_nivel1 = Sal_nivel[1];
 assign Sal_nivel_temp=Sal_nivel[0];
endmodule
```
* Sensor de temperatura:

![8](https://user-images.githubusercontent.com/112178078/204388494-a187346a-c3c6-4c15-8330-bc8679dae6e3.png)

El sensor de temperatura se utiliza de forma activa para poder monitorear constantemente la temperatura de el agua que se tiene en una de las fases de filtro, para la recepcion de los datos que se hace de forma digital, luego por medio de una maquina de estados se hace una recepcion de datos de tal manera que se pasen 16 bits de tal manera que se obtenga una lectura clara de temperatura.

```
module temperatura(
  input         clk,                   
  input         rst_n,                  
  inout         data_temp,              
  output [15:0] temperature   );          


reg [5:0] cnt;                        

always @ (posedge clk, negedge rst_n)
  if (!rst_n)
    cnt <= 0;
  else
    if (cnt == 49)
      cnt <= 0;
    else
      cnt <= cnt + 1'b1;

reg clk_1us;                            

always @ (posedge clk, negedge rst_n)
  if (!rst_n)
    clk_1us <= 0;
  else
    if (cnt <= 24)                     
      clk_1us <= 0;
    else
      clk_1us <= 1;      


reg [19:0] cnt_1us;                      
reg cnt_1us_clear;                      

always @ (posedge clk_1us) begin
  if (cnt_1us_clear)
    cnt_1us <= 0;
  else
    cnt_1us <= cnt_1us + 1'b1;
end
parameter S00     = 5'h00;
parameter S0      = 5'h01;
parameter S1      = 5'h03;
parameter S2      = 5'h02;
parameter S3      = 5'h06;
parameter S4      = 5'h07;
parameter S5      = 5'h05;
parameter S6      = 5'h04;
parameter S7      = 5'h0C;
parameter WRITE0  = 5'h0D;
parameter WRITE1  = 5'h0F;
parameter WRITE00 = 5'h0E;
parameter WRITE01 = 5'h0A;
parameter READ0   = 5'h0B;
parameter READ1   = 5'h09;
parameter READ2   = 5'h08;
parameter READ3   = 5'h18;

reg [4:0] state;                     


reg one_wire_buf;                     

reg [15:0] temperature_buf;           
reg [5:0] step;                        
reg [3:0] bit_valid;                  
  
always @(posedge clk_1us, negedge rst_n)
begin
  if (!rst_n)
  begin
    one_wire_buf <= 1'bZ;
    step         <= 0;
    state        <= S00;
  end
  else
  begin
    case (state)
      S00 : begin              //0000 0000 0001 1111 16 bit for
              temperature_buf <= 16'h001F; 
              state           <= S0;
            end
      S0 :  begin                       
              cnt_1us_clear <= 1;
              one_wire_buf  <= 0;              
              state         <= S1;
            end
      S1 :  begin
              cnt_1us_clear <= 0;
              if (cnt_1us == 500)        
              begin
                cnt_1us_clear <= 1;
                one_wire_buf  <= 1'bZ;      
              state <= S0;
             end
            end
      S4 :  begin
              cnt_1us_clear <= 0;
              if (cnt_1us == 400)         
              begin
                cnt_1us_clear <= 1;
                state         <= S5;
              end 
            end        
      S5 :  begin                   
              if      (step == 0)      
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 1)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 2)
              begin                
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01; 
              end
              else if (step == 3)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;                
              end
              else if (step == 4)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 5)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 6)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;
              end
              else if (step == 7)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;
              end
              
              else if (step == 8)      
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 9)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 10)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;
              end
              else if (step == 11)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 12)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 13)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 14)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;
                 
              end
              else if (step == 15)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              
              else if (step == 16)
              begin
                one_wire_buf <= 1'bZ;
                step         <= step + 1'b1;
                state        <= S6;                
              end
              

              else if (step == 17)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 18)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 19)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;                
              end
              else if (step == 20)
              begin
                step  <= step + 1'b1;
                state <= WRITE01;
                one_wire_buf <= 0;
              end
              else if (step == 21)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 22)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 23)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;
              end
              else if (step == 24)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;               
              end
              
              else if (step == 25)     
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 26)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;                
              end
              else if (step == 27)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;                
              end
              else if (step == 28)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;                
              end
              else if (step == 29)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;
              end
              else if (step == 30)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;
              end
              else if (step == 31)
              begin
                step  <= step + 1'b1;
                state <= WRITE0;
              end
              else if (step == 32)
              begin
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= WRITE01;
              end
              
              else if (step == 33)
              begin
                step  <= step + 1'b1;
                state <= S7;
              end 
            end
      S6 :  begin
              cnt_1us_clear <= 0;
              if ((cnt_1us == 750000) | data_temp)    
              begin
                cnt_1us_clear <= 1;
                state         <= S0;   
              end 
            end
            
      S7 :  begin                     
              if      (step == 34)
              begin
                bit_valid    <= 0;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;
              end
              else if (step == 35)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;
              end
              else if (step == 36)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;
              end
              else if (step == 37)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;               
              end
              else if (step == 38)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 39)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;               
              end
              else if (step == 40)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 41)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;
              end
              else if (step == 42)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 43)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;
              end
              else if (step == 44)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 45)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 46)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 47)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 48)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 49)
              begin
                bit_valid    <= bit_valid + 1'b1;
                one_wire_buf <= 0;
                step         <= step + 1'b1;
                state        <= READ0;                
              end
              else if (step == 50)
              begin
                step  <= 0;
                state <= S0;
              end 
            end            
            
            
     
      WRITE0 :
            begin
              cnt_1us_clear <= 0;
              one_wire_buf  <= 0;                 
              if (cnt_1us == 80)        
              begin
                cnt_1us_clear <= 1;
                one_wire_buf  <= 1'bZ;            
                state         <= WRITE00;
              end 
            end
      WRITE00 :                       
              state <= S5;
      WRITE01 :                       
              state <= WRITE1;
      WRITE1 :
            begin
              cnt_1us_clear <= 0;
              one_wire_buf  <= 1'bZ;   
              if (cnt_1us == 80)        
              begin
                cnt_1us_clear <= 1;
                state         <= S5;
              end 
            end
     
      READ0 : state <= READ1;          
      READ1 :
            begin
              cnt_1us_clear <= 0;
              one_wire_buf  <= 1'bZ;   
              if (cnt_1us == 10)       
              begin
                cnt_1us_clear <= 1;
                state         <= READ2;
              end 
            end
      READ2 :                          
            begin
              temperature_buf[bit_valid] <=data_temp;
              state                      <= READ3;
            end
      READ3 :
            begin
              cnt_1us_clear <= 0;
              if (cnt_1us == 55)       
              begin
                cnt_1us_clear <= 1;
                state         <= S7;
              end 
            end
    
      
      default : state <= S00;
    endcase 
  end 
end 

assign data_temp = one_wire_buf;         

wire [15:0] t_buf = temperature_buf & 16'h07FF;

assign temperature[3:0]   = (t_buf[3:0] * 10) >> 4;

assign temperature[7:4]   = (((t_buf[7:4] * 10) >> 4) >= 4'd10) ? (((t_buf[7:4] * 10) >> 4) - 'd10) : ((t_buf[7:4] * 10) >> 4);

assign temperature[11:8]  = (((t_buf[7:4] * 10) >> 4) >= 4'd10) ? (((t_buf[11:8] * 10) >> 4) + 'd1) + 'd2 : ((t_buf[11:8] * 10) >> 4) + 'd2;

assign temperature[15:12] = temperature_buf[12] ? 1 : 0;

endmodule
```

* Valvula:

![12](https://user-images.githubusercontent.com/112178078/204396275-16e752d4-d1a8-45b1-9c20-2070cd2900cb.png)

La valvula es un periferico de salida, en este caso se uso una valvula normalmente cerrada que va a utilizar una alimentacion de 12V DC con lo que abre el flujo de agua, si tiene 0 V DC se encuentra cerrado, sin embargo para realizar una conexion segura con la FPGA y que se reciba la potencia necesaria en la valula se hace una conexion por medio de un rele, que aisla magneticamente los componentes, por un lado se conecta el rele a una fuente de 12V y por el otro se conecta  la salida logica de la FPGA y la tierra, con esto se alcanzan aproximadamente 3V, se hace la conmutacion del rele, con lo que se acciona la valvula.

```
module Valvula(
  input         control_sig,                        
  output        sal_val   
  );          

assign sal_val=~control_sig;
/*reg sal_aux;
                      
always@(control_sig)begin  
case(control_sig)
        1'b0:  sal_aux = 1;
        
        1'b1:  sal_aux = 0;
        
        default:sal_aux = 0;
    endcase
end
assign sal_val = sal_aux;
*/
endmodule
```
* Modulo Wi-Fi:

![6](https://user-images.githubusercontent.com/112178078/204388485-83c42d82-8bb1-4976-bc5a-2069057a27a3.png)

Una parte que no es fundamental para la operacion pero si en transmision de datos seria el uso del modulo ESP8266, tiene diferentes modos de conexion pero puntualmente para este caso se necesita utilizar los puertos UART, sin embargo es el unico periferico no implementado directamente en la FPGA, este se comunica directamente con Arduino y el codigo utilizado es el siguiente:

```
#include <ESP8266WiFi.h>

const char* ssid = "WifiNaylamp";
const char* password = "123456789";


WiFiServer server(80);

void setup() {
  Serial.begin(9600);
  delay(10);

  //Configuración  del GPIO2
  pinMode(2, OUTPUT);
  digitalWrite(2,LOW);
  
  
  Serial.println();
  Serial.println();
  Serial.print("Conectandose a red : ");
  Serial.println(ssid);
  
  WiFi.begin(ssid, password); //Conexión a la red
  
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi conectado");
  
  
  server.begin(); //Iniciamos el servidor
  Serial.println("Servidor Iniciado");


  Serial.println("Ingrese desde un navegador web usando la siguiente IP:");
  Serial.println(WiFi.localIP()); //Obtenemos la IP
}

void loop() {
  
  WiFiClient client = server.available();
  if (client) //Si hay un cliente presente
  { 
    Serial.println("Nuevo Cliente");
    
    //esperamos hasta que hayan datos disponibles
    while(!client.available()&&client.connected())
    {
    delay(1);
    }
    
    // Leemos la primera línea de la petición del cliente.
    String linea1 = client.readStringUntil('r');
    Serial.println(linea1);

    if (linea1.indexOf("LED=ON")>0) //Buscamos un LED=ON en la 1°Linea
    {
      digitalWrite(2,HIGH);
    }
    if (linea1.indexOf("LED=OFF")>0)//Buscamos un LED=OFF en la 1°Linea
    {
      digitalWrite(2,LOW);
    }
    
    client.flush(); 
                
    Serial.println("Enviando respuesta...");   
    //Encabesado http    
    client.println("HTTP/1.1 200 OK");
    client.println("Content-Type: text/html");
    client.println("Connection: close");// La conexión se cierra después de finalizar de la respuesta
    client.println();
    //Pagina html  para en el navegador
    client.println("<!DOCTYPE HTML>");
    client.println("<html>");
    client.println("<head><title>Naylam Mechatronics</title>");
    client.println("<body>");
    client.println("<h1 align='center'>Test ESP8266</h1>");
    client.println("<div style='text-align:center;'>");
    client.println("<br />");            
    client.println("<button onClick=location.href='./?LED=ON'>LED ON</button>");           
    client.println("<button onClick=location.href='./?LED=OFF'>LED OFF</button>");
    client.println("<br />");
    client.println("</div>");
    client.println("</body>");
    client.println("</html>");
    
    delay(1);
    Serial.println("respuesta enviada");
    Serial.println();

  }
}
```

Adicionalmente se tuvo problemas para configurar el puerto puesto que se necesitaba un adaptador con el cual se pudiera configurar el punto de accseso para el dispositvo, finalmente no se uso por este motivo.
* Servomotor:

![4](https://user-images.githubusercontent.com/112178078/204388475-a31bbb1a-ab1c-4043-8836-6a5507289978.png)

El servomotor se controla con un PWM controlado por ancho de pulso, es decir, si se le entrega un ciclo de trabajo muy grande va a inclinar aproximadamente los 180 grados que vamos a usar, para este caso se usan grados pequenos de 15 grados, sin embargo para la prueba de funcionamiento se establecen 0, 90,180 grados, adicionalmente es necesario usar un clk de aproximadamente 50hz.

```
module servo_p (
		input clk,
		input [1:0]pos,
		//input valor_led,			// ejemplo dato que llega al bloque
		output reg servo_o
		/* incluir las señales necesarias*/
		
   );
	
	reg [20:0]contador=0;
	//reg servo_r;
	
/******************************************************************
HDL EJEMPLO  SE DEBE MODIFICAR 
******************************************************************/
	always@(posedge clk)begin
	contador = contador + 1;
	if(contador =='d1_000_000) begin
	   contador = 0;
	end
	
	case(pos)
        2'b00:  servo_o = (contador < 'd50_000) ? 1:0;
        
        2'b01:  servo_o = (contador < 'd150_000) ? 1:0;
        
        2'b10:  servo_o = (contador < 'd250_000) ? 1:0;
        
        default:servo_o = (contador < 'd50_000) ? 1:0;
    endcase

end
```

endmodule
* Arduino
Se involucró el uso de arduino como parte de la lectura del sensor de nivel de agua, este sensor tiene como salida una señal análoga, por lo que se implementó la placa para recibir los datos análogos y convertir los datos en una salida digital.

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

**Mapa de Memoria**

![14](https://user-images.githubusercontent.com/112178078/204687074-1d9db02f-8c53-4aa5-82e2-ead193719dc5.png)
 
![15](https://user-images.githubusercontent.com/112178078/204687448-4b4ff70a-933f-4437-9fc7-d70c9b3eebd1.png)

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


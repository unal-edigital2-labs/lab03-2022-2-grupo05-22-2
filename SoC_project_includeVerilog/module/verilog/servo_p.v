`timescale 1ns / 1ps

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

	//assign  servo_o = servo_r;

endmodule

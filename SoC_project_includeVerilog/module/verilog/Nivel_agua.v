

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




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


from migen import *
from migen.genlib.cdc import MultiReg
from litex.soc.interconnect.csr import *
from litex.soc.interconnect.csr_eventmanager import *

# Modulo Principal
class GPIOverilog(Module,AutoCSR):
    def __init__(self, data):
        self.clk = ClockSignal()   
        self.rst = ResetSignal()  
        self.xclk = data.xclk
        self.salida_led=data.salida_led

        self.done= CSRStatus()
        self.valor_led= CSRStorage()
        
        self.specials +=Instance("GPIOv",
            i_clk = self.clk,
            i_rst = self.rst,
            o_xclk = self.xclk,
            o_salida_led =self.salida_led,
           i_valor_led =self.valor_led.storage,
            o_done =self.done.status,
        )
        
        
       
        self.submodules.ev = EventManager()
        self.ev.ok = EventSourceProcess()
        self.ev.finalize()
 
        self.ev.ok.trigger.eq(self.done.status)
        
        
        
class ServoVerilog(Module, AutoCSR):
    def __init__(self, data):
            self.clk = ClockSignal()
            self.pos = CSRStorage(2)
            self.servo_o = data.servo_o
            
            self.specials +=Instance("servo_p",
            	i_clk = self.clk,
            	i_pos = self.pos.storage,
            	o_servo_o = self.servo_o,
            	)
            	
class TempVerilog(Module, AutoCSR):
    def __init__(self, data):
            self.clk = ClockSignal()
            self.rst_n = ResetSignal()
            self.data_temp= data.data_temp
            self.temperature=CSRStatus(16)
            
            self.specials +=Instance("temperatura",
            	i_clk = self.clk,
            	i_rst_n = self.rst_n,
            	io_data_temp = self.data_temp,
            	o_temperature = self.temperature.status,
            	)

class ValVerilog(Module, AutoCSR):
    def __init__(self, data):
            self.control_sig = CSRStorage()
            self.sal_val= data.sal_val
            
            self.specials +=Instance("Valvula",
            	i_control_sig = self.control_sig.storage,
            	o_sal_val= self.sal_val,
            	)
            	
class MQ3Verilog(Module, AutoCSR):
    def __init__(self, data):
            self.Alcohol_ent = data.Alcohol_ent
            self.Alcohol_sal= CSRStatus()
            
            self.specials +=Instance("MQ3",
            	i_Alcohol_ent = self.Alcohol_ent ,
            	o_Alcohol_sal= self.Alcohol_sal.status,
            	)            	

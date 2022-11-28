from migen import *
from migen.genlib.cdc import MultiReg
from litex.soc.interconnect.csr import *
from litex.soc.interconnect.csr_eventmanager import *

# Modulo Principal

class NivelVerilog(Module, AutoCSR):
    def __init__(self, data):
            self.clk = ClockSignal()
            self.Ent_nivel0 = data.Ent_nivel0
            self.Ent_nivel1 = data.Ent_nivel1
            self.Sal_nivel1= CSRStatus()
            self.Sal_nivel_temp= CSRStatus()
            
            self.specials +=Instance("Nivel_agua",
            	i_clk = self.clk ,
            	i_Ent_nivel0 = self.Ent_nivel0 ,
            	i_Ent_nivel1 = self.Ent_nivel1 ,
            	o_Sal_nivel1 = self.Sal_nivel1.status,
            	o_Sal_nivel_temp= self.Sal_nivel_temp.status,
            	)     


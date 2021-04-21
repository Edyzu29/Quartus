library IEEE;
use ieee.std_logic_1164.all;
--------------------
Entity Divisor is
	
	Port(
		CLK: in std_logic;
		salida: out bit
	);
	
End Divisor;
--------------------
Architecture maind of Divisor is
	
	Constant DESVORDA: std_logic_vector (27 downto 0):= x"‭2FAF07F‬" ;
	Signal conta: std_logic_vector ( 27 downto 0) ;
	Signal makaku:bit;
	
	
begin

	Process(Clk)
	begin
		
			if(CLK'Event and CLK='1')
					
				-----Conpaador
				if(Contador = DESVORDA) then
				
					Contador = (OTHERS => '0')
				
				else
					Conta <= Conta + x"0000001";
				
				
				end if;
				-----Pulso
				if(Conta = "11") then
				
					makaku<='1';
					
				else
					
					mamaku<= '0';
				
				end if;
			
			end if;
	
	end process;

End maind;
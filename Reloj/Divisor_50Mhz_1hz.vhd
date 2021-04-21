library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--------------------
Entity Divisor_50Mhz_1hz is
	
	Port(
		CLK: in std_logic;
		salida: out bit
	);
	
End Divisor_50Mhz_1hz;
--------------------
Architecture maind of Divisor_50Mhz_1hz is
	
	Constant DESVORDA: std_logic_vector (27 downto 0):= x"2FAF07F" ;
	Signal Contador: std_logic_vector ( 27 downto 0) ;
	Signal makaku:bit;
	
	
begin

	Process(Clk)
	begin
		
			if(CLK'Event and CLK='1') then
					
				-----Conpaador
				if(Contador = DESVORDA) then
				
					Contador <= (OTHERS => '0');
				
				else
					Contador <= Contador + x"0000001";
				
				
				end if;
				-----Pulso
				if(Contador = "11") then
				
					makaku<='1';
					
				else
					
					makaku<= '0';
				
				end if;
			
			end if;
	
	end process;
	
	Salida <= Makaku;

End maind;
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--------------------
Entity Contador_4bits is
	Port(
		CLK: 		in 		std_logic;
		Load:		in			std_logic;
		Enable:	in			std_logic;
		uili: 	in 		std_logic_vector (3 downto 0);
		salida: 	out 		std_logic_vector (3 downto 0)
		);
End Contador_4bits;
--------------------
Architecture maind of Contador_4bits is
	
	Signal conta1: std_logic_vector ( 7 downto 0):= x"00";
	
	Constant Derborda: std_logic_vector (7 downto 0):=x"09";
	
begin
--------------
--------------	
	Process(CLK, Load)
	begin
		if(Load = '1') then
			
			Conta1 <= x"0" & uili;
			
		else
			if(CLK'event and CLK = '1') then
			
				if (Enable = '0') then
		
					if(Conta1=Derborda) then
					
						Conta1<= x"00";
						
					else
					
						Conta1 <= Conta1 + x"01";
					
					end if;
				end if;
			end if;
		end if;
	end process;
--------------

	Salida <= Conta1(3 downto 0);

--------------
End maind;
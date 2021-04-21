library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--------------------
Entity Divisor is
	Port(
		CLK: in std_logic;
		salida: out std_logic
	);
End Divisor;
--------------------
Architecture maind of Divisor is
	
	Constant DESVORDA: std_logic_vector (27 downto 0):= x"000C34F"; --- 50 Mhz a 1 Khz
	Signal conta: std_logic_vector ( 27 downto 0) ;
	
	
begin

	Process(Clk)
	begin
		
			if(CLK'Event and CLK='1') then
					
				-----Conpaador
				if(Conta = DESVORDA) then
				
					Conta <= (OTHERS => '0');
				
				else
					Conta <= Conta + x"0000001";
				
				end if;
				-----Pulso
				if(Conta = DESVORDA) then
				
					Salida<='1';
					
				else					
					Salida<='0';

				end if;
			end if;
	end process;
End maind;
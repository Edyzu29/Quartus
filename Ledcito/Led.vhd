library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--------------------
Entity Led is
	
	Port(
		CLK: in std_logic;
		salida: buffer bit
	);
	
End Led;
--------------------
Architecture maind of led is
	
	Constant DESBORDA: std_logic_vector (27 downto 0):= x"2FAF07F";
	Signal conta: std_logic_vector ( 27 downto 0) ;
	Signal makaku:bit;
	
	
begin

	Process(Clk)
	begin
		
			if(CLK'Event and CLK='1') then
					
				-----Conpaador
				if(Conta = DESBORDA) then
				
					Conta <= (OTHERS => '0');
				
				else
					Conta <= Conta + x"0000001";
				
				
				end if;
				-----Pulso
				if(Conta = DESBORDA) then
				
					makaku<='1';
					
				else
					
					makaku<='0';
				
				end if;
			
			end if;
	
	end process;
	
	------LED
	Process(makaku)
	begin
	
		if(makaku'event and makaku = '1') then
		
			salida <= not salida;
		
		end if;
	
	end process;
	
	-----Convinacional
	
	
End maind;
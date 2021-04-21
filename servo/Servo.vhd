library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--------------------
Entity Servo is
	
	Port(
		CLK: in std_logic;
		uili: in std_logic_vector (3 downto 0);
		salida: buffer bit
	);
	
End Servo;
--------------------
Architecture maind of Servo is
	
	Constant DESBORDA: std_logic_vector (27 downto 0):= x"0000031";
		
	Signal conta0: std_logic_vector ( 27 downto 0);
	Signal conta1: std_logic_vector ( 15 downto 0) ;
	
	Signal makaku:bit;
	
	signal Guty_cicle: std_logic_vector (15 downto 0);

	
	signal pwm: bit;
	
begin

	Process(Clk)
	begin
		
			if(CLK'Event and CLK='1') then
					
				-----Conpaador
				if(Conta0 = DESBORDA) then
				
					Conta0 <= (OTHERS => '0');
				
				else
					Conta0 <= Conta0 + x"0000001";
				
				
				end if;
				-----Pulso
				if(Conta0 = DESBORDA) then
				
					makaku<='1';
					
				else
					
					makaku<='0';
				
				end if;
			
			end if;
	
	end process;
	
	Process(makaku)
	begin
	
		if(makaku'event and makaku = '1') then
	

				if(Conta1=x"4e1f") then
				
					Conta1<= x"0000";
					
				else
				
					Conta1 <= Conta1 + x"0001";
				
				end if;
		
		end if;
	
	end process;
	
	
	 pwm<= '1' when (conta1 <= Guty_cicle) else
			 '0';
	
	salida<=pwm;
	
	--Seleccion del daty cilce

	
	with uili select
	
	 Guty_cicle <=	x"01f3" when x"0",
						x"0340" when x"1",
						x"048D" when x"2",
						x"05DA" when x"3",
						x"0728" when x"4",
						x"0875" when x"5",
						x"09C3" when others;
	
End maind;
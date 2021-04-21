LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
------------------------------------------------------------

ENTITY Despacito IS
	PORT (
			rst, sentido, clk: IN STD_LOGIC;
			salida: OUT STD_LOGIC_vector (3 downto 0)
			);
END Despacito;
---------------
Architecture I297 of Despacito Is

	TYPE state IS (A, B, C, D);
	
	SIGNAL pr_state, nx_state: state;
	Signal selector: std_logic_vector (3 downto 0); 
	
	Signal Clock_1Mz: std_logic;
	Signal Clock_1z: std_logic;
	
	Constant DESBORDA0: std_logic_vector (27 downto 0):= x"0000031";
	Constant DESBORDA1: std_logic_vector (15 downto 0):= x"270F";
		
	Signal conta0: std_logic_vector ( 27 downto 0);
	Signal conta1: std_logic_vector ( 15 downto 0);
	Signal conta2: std_logic_vector ( 7 downto 0);
	
	signal Guty_cicle: std_logic_vector (15 downto 0);
	
	signal pwm: STD_LOGIC;


begin
----------------- Divisor de 50MHz a 1MHz
	Process(Clk)
	begin
		
			if(CLK'Event and CLK='1') then
					
				-----Conpaador
				if(Conta0 = DESBORDA0) then
				
					Conta0 <= (OTHERS => '0');
				
				else
					Conta0 <= Conta0 + x"0000001";
				
				
				end if;
				-----Pulso
				if(Conta0 = DESBORDA0) then
				
					Clock_1Mz<='1';
					
				else
					
					Clock_1Mz<='0';
				
				end if;
			
			end if;
	
	end process;
	----------------------------------
	--				
	-------------- Divisor de 1Mhz a 100Hz
	Process(Clock_1Mz)
	begin
		
			if(Clock_1Mz'Event and Clock_1Mz='1') then
					
				-----Conpaador
				if(Conta1 = DESBORDA1) then
				
					Conta1 <= (OTHERS => '0');
				
				else
					Conta1 <= Conta1 + x"0001";
				
				
				end if;
				-----Pulso
				if(Conta1 = DESBORDA1) then
				
					Clock_1z<='1';
					
				else
					
					Clock_1z<='0';
				
				end if;
			
			end if;
	
	end process;


	process(Clock_1z,sentido,rst)
	begin
		
		if(rst='1')
			Conta2=x"00";
			
		end if;
		
		if(Clock_1z'Event and Clock_1z='1')
		
			if(sentido='1')
			
				-----Conpaador
				if(Conta1 = ) then
				
					Conta1 <= (OTHERS => '0');
				
				else
					Conta1 <= Conta1 + x"01";
			
			end if;
		
		END IF;
		
	end process;

End I297;
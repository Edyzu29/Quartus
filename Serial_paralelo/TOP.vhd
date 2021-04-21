library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-----------
Entity TOP is 
	Port(
		Serial_int: in std_logic;
		Buton:	in std_logic;
		Clk_50M:	in std_logic;
		Salida:  OUT std_logic_vector (3 downto 0)
	);
End TOP;
-------------
Architecture TOP of TOP IS 

	Component Divisor is		
		Port(
			CLK: in std_logic;
			salida: out std_logic
		);
	End Component;

	Component Serial_Paralelo is
		generic (n: integer:=4);
		port(
			CLK: IN STD_logic;
			Serial_int: In Std_logic;
			q: buffer Std_logic_vector(n-1 downto 0)
		);	
	End Component;

	Component de_bounce is
		port(
			CLK_1k:	 IN STD_logic;
			buton_dirty: In Std_logic;
			Buton_clean: out Std_logic
		);
	End Component;
	--------------------
	--------------------
	--Señales
	--------------------
	Signal Clk_general : Std_logic;
	Signal Buton_clean : Std_logic;
	
Begin

	Clock_general  : Divisor 			 PORT MAP (Clk_50M, Clk_general);
	De_debonca	   : de_bounce 		 Port Map (Clk_general, Buton, Buton_clean);
	Serial_paralela: Serial_Paralelo  Port Map (Buton_clean, Serial_int, Salida);


end TOP;
Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--------------------------------
Entity TOP is
	Generic( n: Integer :=4);
	Port(
		Entrada_1bit: 		in 		Std_logic;
		Enable: 				in 		Std_logic;
		Load: 				in 		Std_logic;
		Clock:				in 		Std_logic;
		buton:				In			Std_logic;
		Entrada_nbits: 	in			Std_logic_vector(n-1 downto 0);
		Salida_nbits:		buffer	Std_logic_vector(n-1 downto 0)
	);

End TOP;
--------------------------------
Architecture TOP of TOP is
-----------------
-----------------	Componentes
-----------------
	Component de_bounce is
	port(
		CLK_1k:	 IN STD_logic;
		buton_dirty: In Std_logic;
		Buton_clean: out Std_logic
		);
	END Component;
	
	Component Divisor is
	Port(
		CLK: in std_logic;
		salida: out std_logic
		);
	End Component;
	
	Component Shift_Register_right is
	Generic( n: Integer :=4);
	Port(
		Entrada_1bit: 		in 		Std_logic;
		Enable: 				in 		Std_logic;
		Load: 				in 		Std_logic;
		Clock:				in 		Std_logic;
		Entrada_nbits: 	in			Std_logic_vector(n-1 downto 0);
		Salida_nbits:		buffer	Std_logic_vector(n-1 downto 0)
		);
	End Component;
-----------------
-----------------	Señales
-----------------
	Signal Sel:	Std_logic_vector(1 downto 0);
	Signal Boton_clean: Std_logic;
	Signal Ck_general: std_logic;
-----------------
Begin
-----------------
-----------------
	Divisor_50Mhz_a_1khz: Divisor   					Port Map(Clock, Ck_general);
	Limpieza_de_boton: 	 de_bounce 					Port Map(Ck_general, buton, Boton_clean);
	Shift_Registro: 		 Shift_Register_right	GENERIC MAP(n => 4) Port Map(Entrada_1bit, Enable, Load, Boton_clean, Entrada_nbits, Salida_nbits);
-----------------
-----------------
End Top;
Library IEEE;
use ieee.std_logic_1164.all;
----------------------------
Entity Data_path is
	Generic( n: Integer:=8 );
	Port(
		--------------
		Data_Register:	IN Std_logic_vector(n-1 downto 0);
		Data_Contador:	IN Std_logic_vector(n-5 downto 0);
		---
		Load_Register:	IN Std_logic;
		Load_Contador:	IN Std_logic;
		---
		Enab_Register:	IN Std_logic;
		Enab_Contador:	IN Std_logic;
		---
		Clock_50Mz:		IN Std_logic;
		Boton_dirty:	IN Std_logic;
		--------------
		--------------
		--------------
		tall_Register:	OUT std_logic;
		Contador_out:	OUT Std_logic_vector(n-5 downto 0);
		Valor_REgiste: OUT std_logic
		--------------
	);
end Data_path;
--------------------
Architecture Data_path of Data_path is
	--------------
	--------------	COmponentes
	--------------
	Component Contador_4bits is
		Port(
			CLK: 		in 		std_logic;
			Load:		in			std_logic;
			Enable:	in			std_logic;
			uili: 	in 		std_logic_vector (3 downto 0);
			salida: 	out 		std_logic_vector (3 downto 0)
			);
	End Component;
	-------------------
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
	------------------
	Component Divisor is
		Port(
			CLK: in std_logic;
			salida: out std_logic
		);
	End Component;
	-----------------
	Component de_bounce is
		port(
			CLK_1k:	 IN STD_logic;
			buton_dirty: In Std_logic;
			Buton_clean: out Std_logic
		);
	END Component;
	--------------
	--------------	Signal
	--------------
	signal Clock_general:  Std_logic;
	signal Dirty_Register: Std_logic_vector(n-1 downto 0);
	signal Boton_Clean:	 Std_logic;
	--------------
begin

--------- INstanciamiento
	Divisora: 	Divisor 	 				PORT MAP (Clock_50Mz, Clock_general);
	--
	--
	REgistro:	Shift_Register_right Generic MAP(n=>8) Port MAP ('0', Enab_Register, Load_Register, Boton_Clean, Data_Register, Dirty_Register);
	--
	COntador:	Contador_4bits 		PORT MAP (Boton_Clean, Load_Contador, Enab_Contador, Data_Contador, Contador_out);
---------
--------- Conbinacional
---------
	tall_Register <= not (Dirty_Register(0) OR Dirty_Register(1) OR Dirty_Register(2) OR Dirty_Register(3) OR Dirty_Register(4) OR Dirty_Register(5) OR Dirty_Register(6) OR Dirty_Register(7));
	Valor_REgiste <= Dirty_Register(0);
	
---------
end Data_path;
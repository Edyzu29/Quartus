Library IEEE;
use IEEE.std_logic_1164.all;
----------------------------
Entity Suamdor_de_4bits is
	Port(
		X, y: 		IN 	Std_logic_vector (3 downto 0);
		C_in: 		In 	Std_logic 						  ;
		----------------------------
		Suma_4bits: Out 	std_Logic_vector (3 downto 0);
		C_out: 		out 	Std_logic
	);
end Suamdor_de_4bits;
----------------------------
Architecture Suamdor_de_4bits of Suamdor_de_4bits is

------------
------------ Componentes
------------
Component Suamdor_1bit is

Port(
	A, 	B,		 C_in    : In  Std_logic;
	Suma_1bit, C_out_1bit: Out Std_logic
);

end Component;
-------------
------------- Señales 
-------------

Signal C1, C2, C3 : 	   Std_Logic;

Begin 

U0: Suamdor_1bit Port Map ( A => X(0) , B =>Y(0) ,C_in => C_in, C_out_1bit => C1,    Suma_1bit => Suma_4bits (0));
U1: Suamdor_1bit Port Map ( A => X(1) , B =>Y(1) ,C_in => C1  , C_out_1bit => C2,    Suma_1bit => Suma_4bits (1));
U2: Suamdor_1bit Port Map ( A => X(2) , B =>Y(2) ,C_in => C2  , C_out_1bit => C3,    Suma_1bit => Suma_4bits (2));
U3: Suamdor_1bit Port Map ( A => X(3) , B =>Y(3) ,C_in => C3  , C_out_1bit => C_out, Suma_1bit => Suma_4bits (3));



End Suamdor_de_4bits;
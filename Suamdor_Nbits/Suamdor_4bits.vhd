Library IEEE;
use IEEE.std_logic_1164.all;
----------------------------
Entity Suamdor_4bits is
	generic (N: Integer:=4);
	Port(
		X, y: 		IN 	Std_logic_vector (n-1 downto 0);
		C_in: 		In 	Std_logic 						  ;
		----------------------------
		Suma_4bits: Out 	std_Logic_vector (n-1 downto 0);
		C_out: 		out 	Std_logic
	);
end Suamdor_4bits;
----------------------------
Architecture Suamdor_4bits of Suamdor_4bits is

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

Signal C_outs: Std_logic_vector(n downto 0);

Begin 
	C_outs(0) <= C_in;
	C_out<= C_outs(n);
	
	pepe: FOR i IN 0 TO n-1 GENERATE
		
		U0: Suamdor_1bit Port Map ( A => X(i) , B =>Y(i) ,C_in => C_outs(i), C_out_1bit => C_outs(i+1),    Suma_1bit => Suma_4bits (i));

	end generate;
		

End Suamdor_4bits;
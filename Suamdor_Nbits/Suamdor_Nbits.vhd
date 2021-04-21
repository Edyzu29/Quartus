Library IEEE;
use IEEE.std_logic_1164.all;
----------------------------
Entity Suamdor_Nbits is
	Port(
		X, y: 		IN 	Std_logic_vector (7 downto 0);
		C_in: 		In 	Std_logic 						  ;
		----------------------------
		Suma_4bits: Out 	std_Logic_vector (7 downto 0);
		C_out: 		out 	Std_logic
	);
end Suamdor_Nbits;
----------------------------
Architecture Suamdor_Nbits of Suamdor_Nbits is

------------
------------ Componentes
------------
Component Suamdor_4bits is
generic (N: Integer:=4);
	Port(
		X, y: 		IN 	Std_logic_vector (n-1 downto 0);
		C_in: 		In 	Std_logic 						  ;
		----------------------------
		Suma_4bits: Out 	std_Logic_vector (n-1 downto 0);
		C_out: 		out 	Std_logic
	);

end Component;
-------------
------------- Señales 
-------------

Begin 
		
	U0: Suamdor_4bits	GENERIC MAP(n => 8) Port Map ( X, Y, C_in, Suma_4bits, C_out);


End Suamdor_Nbits;
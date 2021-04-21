Library Ieee;
use ieee.std_logic_1164.all;
---------------------------------------
Entity Projecto_X Is

	Port(
		a,b,c,d:IN std_logic;
		x,y: out std_logic		
	);
	
End Projecto_X;
------------------
Architecture Projecto_X of Projecto_X is
--------------
-----Decalarion de Componentes
-------------
Component  Compuerta_nand_3 is

	Port(
		a,b,c: In std_logic;
		d:	out std_logic
	);

end Component;
-------------
Component Compuerta_not is

	Port(
		a: In std_logic;
		c:	out std_logic
	);

end Component;
-------------
Component Compuerta_nand_2 is

	Port(
		a,b: In std_logic;
		c:	out std_logic
	);

end Component;
-------------

Signal S1: std_logic;
--------------
Begin

U1: Compuerta_nand_2 Port Map(a, b, x);
U2: Compuerta_not Port Map(b, S1);
U3: Compuerta_nand_3 Port Map(s1, c, d, y);

End Projecto_X; 
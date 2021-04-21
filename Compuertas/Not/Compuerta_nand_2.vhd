Library Ieee;
use ieee.std_logic_1164.all;

Entity Compuerta_nand_2 is

	Port(
		a,b: In std_logic;
		c:	out std_logic
	);

end Compuerta_nand_2;

Architecture Compuerta_nand_2 of Compuerta_nand_2 is
Begin
	
	c <= a nand b;
	
End Compuerta_nand_2;

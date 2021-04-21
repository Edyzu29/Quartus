Library Ieee;
use ieee.std_logic_1164.all;

Entity Compuerta_nand_3 is

	Port(
		a,b,c: In std_logic;
		d:	out std_logic
	);

end Compuerta_nand_3;

Architecture Compuerta_nand_3 of Compuerta_nand_3 is
Begin
	
	d <= not (a and b and c);
	
End Compuerta_nand_3;

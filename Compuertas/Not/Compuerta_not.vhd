Library Ieee;
use ieee.std_logic_1164.all;

Entity Compuerta_not is

	Port(
		a: In std_logic;
		c:	out std_logic
	);

end Compuerta_not;

Architecture Compuerta_not of Compuerta_not is
Begin
	
	c <= not a;
	
End Compuerta_not;

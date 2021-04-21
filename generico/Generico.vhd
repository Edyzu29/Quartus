---Librerias
Library IEEE;
use Ieee.std_logic_1164.all;
use Ieee.std_logic_unsigned.all;
-------Entity
Entity Generico is
	Generic (n: integer := 20);
	Port(
		Bin_ent: IN STD_logic_vector(n-1 downto 0);
		Gray_ot: out STD_logic_Vector(n-1 downto 0)
	);
end Generico;
--------
Architecture Generico of Generico is
Begin

	--principal
	Gray_ot(0) <= Bin_ent(0);
	---
	Bucle1: For i in 0 to n-2 generate
		Gray_ot(i+1) <= Bin_ent(i) xor Bin_ent(i+1);
	End generate;

end Generico;
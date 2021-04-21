Library IEEE;
use IEEE.std_logic_1164.all;
----------------------------
Entity Suamdor_1bit is

Port(
	A, 	B,		 C_in    : In  Std_logic;
	Suma_1bit, C_out_1bit: Out Std_logic
);

end Suamdor_1bit;
----------------------------
Architecture Suamdor_1bit of Suamdor_1bit is

Signal S1: Std_logic;
Signal S2: Std_logic;
Signal S3: Std_logic;

Begin

	S1 <= A XOR B;
	Suma_1bit <= S1 XOR C_in;
	S2 <= S1 and C_in;
	S3 <= A AND B ;
	C_out_1bit <= S2 OR S3;
	

End Suamdor_1bit;
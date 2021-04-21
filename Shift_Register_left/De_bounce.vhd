Library IEEE;
use ieee.std_logic_1164.all;
------
Entity de_bounce is
	port(
		CLK_1k:	 IN STD_logic;
		buton_dirty: In Std_logic;
		Buton_clean: out Std_logic
	);
END de_bounce;
------
Architecture de_bounce of de_bounce is

	Signal A,B,C: std_logic;

begin
	Process(Clk_1k)
	begin
		If(CLK_1k'event and CLK_1k='0') then
		
			C<=B;
			B<=A;
			A<=buton_dirty;
			
		end if;
	end process;
	
	Buton_clean<= A and B and C;
	
end de_bounce;
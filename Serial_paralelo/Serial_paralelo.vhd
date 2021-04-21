Library IEEE;
use ieee.std_logic_1164.all;
------
Entity Serial_paralelo is
	generic (n: integer:=4);
	port(
		CLK: IN STD_logic;
		Serial_int: In Std_logic;
		q: buffer Std_logic_vector(n-1 downto 0)
	);
END Serial_Paralelo;
------
Architecture Serial_paralelo of Serial_paralelo is
begin
	Process(Clk)
	begin
		If(CLK'event and CLK='0') then
		
			q(n-1) <= seriaL_int;
		
			for i in n-2 downto 0 loop
				q(i) <= q(i+1);
			end loop;
		end if;
	end process;
	
end Serial_paralelo;

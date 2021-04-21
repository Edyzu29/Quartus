library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
--------------------
Entity Contador_10 is
	
	Port(
		CLK: 	  in 	std_logic;
		Enable: In 	Std_logic;
		julito: In 	Std_logic;
		Carry_out: out Std_logic;
		salida: out Std_logic_vector (3 downto 0)
	);
	
End Contador_10;

----------------------------
Architecture Contador_10 of Contador_10 is

Signal Conta1: std_logic_vector (3 downto 0);
Constant TOP: std_logic_vector (3 downto 0):= X"9" ;

begin

	Process(Clk)
	begin
	
		if(CLK'event and CLK = '1') then
		
			if ( Enable and julito ) then
			
				if(Conta1= TOP) then
				
					Conta1<= (OTHERS => '0');
					
				else
				
					Conta1 <= Conta1 + x"1";
				
				end if;
				
			 else 
				
				if(Conta1= x"1") then
				
					Conta1<= (OTHERS => '0');
					
				else
				
					Conta1 <= Conta1 + x"1";
				
				end if;
				
		    end if;		
		 end if;	
	end process;
----------------

	Carry_out <='1' When (Conta1 = x"9") else '0';

	Salida <= Conta1;		
	
end Contador_10;

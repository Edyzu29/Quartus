Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--------------------------------
Entity Shift_Register_Left is
	Generic( n: Integer :=4);
	Port(
		Entrada_1bit: 		in 		Std_logic;
		Enable: 				in 		Std_logic;
		Load: 				in 		Std_logic;
		Clock:				in 		Std_logic;
		Entrada_nbits: 	in			Std_logic_vector(n-1 downto 0);
		Salida_nbits:		buffer	Std_logic_vector(n-1 downto 0)
	);

End Shift_Register_Left;
--------------------------------
Architecture Shift_Register_Left of Shift_Register_Left is

	Signal Sel:	Std_logic_vector(1 downto 0);

Begin
-----------------
-----------------
	sel(0)<= Enable;
	Sel(1)<= Load;
-----------------
-----------------
	Process(sel,Clock)
	begin
	
		if (sel = "10") then --Load
		
			Carga_Asincrona: For i in 0 to n-1 loop
			
				Salida_nbits(i) <= Entrada_nbits(i);
							
			End loop;
			
		else
		
			if(Clock'event and Clock='1') then
						
				Salida_nbits(n-1) <= Entrada_1bit;
							
				for i in 0 to n-2 loop
							
					Salida_nbits(i) <= Salida_nbits(i+1);	
								
				end loop;
				
			end if;
			
		end if;		
	
	end process;
-----------------
-----------------
End Shift_Register_Left;
library IEEE;
use ieee.std_logic_1164.all;
---------------------
Entity Reloj is

	Port(
		Clk: In Std_logic;
		Sec_u: Out Std_logic_Vector(6 downto 0);
		Sec_D: Out Std_logic_Vector(6 downto 0);
		Min_u: Out Std_logic_Vector(6 downto 0);
		Min_D: Out Std_logic_Vector(6 downto 0);
		Hou_u: Out Std_logic_Vector(6 downto 0);
		Hou_D: Out Std_logic_Vector(6 downto 0);
	);

End Reloj;
--------------------------------------------------
Architecture Reloj of Reloj Is
-----------------------
			Component Divisor_50Mhz_1hz is
				
				Port(
					CLK: in std_logic;
					salida: out bit
				);
				
			End Component;
			----------------------
			Component Contador_10 is
				
				Port(
					CLK: 	  in 	std_logic;
					Enable: In 	Std_logic;
					Carry_out: out Std_logic;
					salida: out Std_logic_vector (3 downto 0)
				);
				
			End Component;
			---------------------
			Component Decodificador IS
				PORT
				(
				
				a:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				sal: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
				
				);
			END Component;
			----------------------
			Component Contador_6 is
				
				Port(
					CLK: 	  in 	std_logic;
					Enable: In 	Std_logic;
					Carry_out: out Std_logic;
					salida: out Std_logic_vector (3 downto 0)
				);
				
			End Component;
			-----------------------
			------- Señales
			-----------------------
			Signal Clk_general : Std_logic;
			Signal En12, En34  : Std_logic;
			Signal En1, En2, En3, En4, En5, En6: Std_logic;
			Signal Aux_Sec_u: Std_logic_Vector(3 downto 0);
			Signal Aux_Sec_D: Std_logic_Vector(3 downto 0);
			Signal Aux_Min_u: Std_logic_Vector(3 downto 0);
			Signal Aux_Min_D: Std_logic_Vector(3 downto 0);
			Signal Aux_Hou_u: Std_logic_Vector(3 downto 0);
			Signal Aux_Hou_D: Std_logic_Vector(3 downto 0);
			------
			Signal q_ant: std_logic := '0';

Begin

	En12 <= En1 and En2;
	En34 <= En3 and En24
	
	Process (ClK_general)
	begin
		
		if (ClK_general'event and ClK_general = '1') then
			
			if() then
			
			end if;
			
		end if;
	
	
	end Process;
	

	Clock_general: Divisor_50Mhz_1hz PORT MAP (CLK, Clk_general);
	DEco_Seg_unid: Contador_10 Port Map (Clk_general, '1' , '1' ,En1, Aux_Sec_u);
	DEco_Seg_dece: Contador_6  Port Map (Clk_general, En1 , En2, Aux_Sec_d);
	DEco_Min_unid: Contador_10 Port Map (Clk_general, EN12, '1' ,En3, Aux_Min_u);
	DEco_mIN_dece: Contador_6  Port Map (Clk_general, En3 , En4, Aux_Min_d);
	DEco_Min_unid: Contador_10 Port Map (Clk_general, EN12, En6 ,En5, Aux_Hou_u);
	
End Reloj;

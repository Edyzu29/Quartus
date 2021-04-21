LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
------------------------------------------------------------

ENTITY Moore IS
	PORT (w, reset, clk: IN STD_LOGIC;
			salida: OUT STD_LOGIC);
END Moore;
			
------------------------------------------------------------

ARCHITECTURE arquitectura OF Moore IS

	TYPE state IS (A, B, C, D);
	
	SIGNAL pr_state, nx_state: state;
	Signal selector: std_logic_vector (3 downto 0); 
	
	Signal Clock_1Mz: std_logic;
	Signal Clock_1z: std_logic;
	
	Constant DESBORDA0: std_logic_vector (27 downto 0):= x"0000031";
	Constant DESBORDA1: std_logic_vector (19 downto 0):= x"F423F";
		
	Signal conta0: std_logic_vector ( 27 downto 0);
	Signal conta1: std_logic_vector ( 19 downto 0);
	Signal conta2: std_logic_vector ( 15 downto 0);
	
	signal Guty_cicle: std_logic_vector (15 downto 0);
	
	signal pwm: STD_LOGIC;

	
BEGIN
----------------- Servo
	Process(Clk)
	begin
		
			if(CLK'Event and CLK='1') then
					
				-----Conpaador
				if(Conta0 = DESBORDA0) then
				
					Conta0 <= (OTHERS => '0');
				
				else
					Conta0 <= Conta0 + x"0000001";
				
				
				end if;
				-----Pulso
				if(Conta0 = DESBORDA0) then
				
					Clock_1Mz<='1';
					
				else
					
					Clock_1Mz<='0';
				
				end if;
			
			end if;
	
	end process;
	----------------------------------
	Process(Clock_1Mz)
	begin
		
			if(Clock_1Mz'Event and Clock_1Mz='1') then
					
				-----Conpaador
				if(Conta1 = DESBORDA1) then
				
					Conta1 <= (OTHERS => '0');
				
				else
					Conta1 <= Conta1 + x"00001";
				
				
				end if;
				-----Pulso
				if(Conta1 = DESBORDA1) then
				
					Clock_1z<='1';
					
				else
					
					Clock_1z<='0';
				
				end if;
			
			end if;
	
	end process;
--------------------------------------
Process(Clock_1Mz)
	begin
	
		if(Clock_1Mz'event and Clock_1Mz = '1') then
	

				if(Conta2=x"4e1f") then
				
					Conta2<= x"0000";
					
				else
				
					Conta2 <= Conta2 + x"0001";
				
				end if;
		
		end if;
	
	end process;


----------------- Seccion inferior: ------------------------

	PROCESS (reset, Clock_1z)
	BEGIN
		IF (reset='1') THEN
			pr_state <= A;
		ELSIF (Clock_1z'EVENT AND Clock_1z='1') THEN
			pr_state <= nx_state;
		END IF;
	END PROCESS;
	
----------------- Seccion superior: -----------------------
	
	PROCESS (w, pr_state)
	BEGIN
		CASE pr_state IS
			WHEN A =>
				selector <= x"0";
				IF (w = '1') THEN
					nx_state <= B;
				ELSE
					nx_state <= A;
				END IF;
			WHEN B =>
				selector <= x"1";
				IF (w = '1') THEN
					nx_state <= C;
				ELSE
					nx_state <= A;
				END IF;
			WHEN C =>
				selector <= x"2";
				IF (w = '1') THEN
					nx_state <= D;
				ELSE
					nx_state <= B;
				END IF;
			WHEN D =>
				selector <= x"3";
				IF (w = '1') THEN
					nx_state <= D;
				ELSE
					nx_state <= C;
				END IF;
		END CASE;
		
	END PROCESS;

---------------------------------ANGULOS.
	with Selector select
	
	 Guty_cicle <=	x"01f3" when x"0",
						x"048D" when x"1",
						x"0728" when x"2",
						x"09C3" when others;
	
-------------------------pwm
		pwm<= '1' when (conta2 <= Guty_cicle) else
				'0';

Salida<= pWM;
	
END arquitectura;
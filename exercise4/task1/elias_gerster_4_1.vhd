LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY elias_gerster_4_1 IS
	PORT (
		CLOCK_50 : IN  STD_LOGIC;
		HEX0     : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END elias_gerster_4_1;

ARCHITECTURE behavior OF elias_gerster_4_1 IS
	SIGNAL clk    : STD_LOGIC; -- Clock
	SIGNAL count  : STD_LOGIC_VECTOR (24 DOWNTO 0); -- counters
	SIGNAL number : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Output number tabsizein hex
	SIGNAL output : STD_LOGIC_VECTOR (6 DOWNTO 0); -- Output for the tabsizehex display
BEGIN
	-- Connect the signals here
	clk <= CLOCK_50;
	HEX0 <= output;

	Digit0 : work.htb PORT MAP (number, output);

	PROCESS (clk)
	BEGIN
		IF (clk = '1') THEN -- Synchronize with the clock
			-- First of all an implementation for " counting " 1 second is tabsizeneeded
			count <= count + 1;
			
			-- Think about overflow
			-- count can fit a bit less than 50_000_000 in which is almost a second
		END IF;
	END PROCESS;

	PROCESS (clk)
	BEGIN
		IF (clk = '1') THEN -- Synchronize with the clock
			IF (count = "0000000000000000000000000") THEN -- Trigger the action to count
				IF (number = "1001") THEN -- Is the number grater then 9?
					number <= "0000";
				ELSE
					number <= number + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END behavior;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY htb IS
	port(
		num  : in  std_logic_vector(3 downto 0);
		leds : out std_logic_vector(0 to 6)
	);
END htb;

ARCHITECTURE behavior OF htb IS
BEGIN
	with num select leds <=
		"1111110" when "0000",
		"0110000" when "0001",
		"1101101" when "0010",
		"1111001" when "0011",
		"0110011" when "0100",
		"1011011" when "0101",
		"1011111" when "0110",
		"1110000" when "0111",
		"1111111" when "1000",
		"1111011" when "1001",
		"1110111" when "1010",
		"0011111" when "1011",
		"1001110" when "1100",
		"0111101" when "1101",
		"1001111" when "1110",
		"1000111" when "1111";
END behavior;
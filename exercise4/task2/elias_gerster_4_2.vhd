LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY elias_gerster_4_2 IS
	PORT (
		CLOCK_50 : IN  STD_LOGIC;
		HEX0     : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		HEX1     : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		HEX2     : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END elias_gerster_4_2;

ARCHITECTURE behavior OF elias_gerster_4_2 IS
	SIGNAL clk     : STD_LOGIC; -- Clock
	SIGNAL count   : STD_LOGIC_VECTOR (22 DOWNTO 0); -- counters
	SIGNAL number0 : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Output number tabsizein hex
	SIGNAL number1 : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Output number tabsizein hex
	SIGNAL number2 : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Output number tabsizein hex
	SIGNAL output0 : STD_LOGIC_VECTOR (6 DOWNTO 0); -- Output for the tabsizehex display
	SIGNAL output1 : STD_LOGIC_VECTOR (6 DOWNTO 0); -- Output for the tabsizehex display
	SIGNAL output2 : STD_LOGIC_VECTOR (6 DOWNTO 0); -- Output for the tabsizehex display
BEGIN
	-- Connect the signals here
	clk <= CLOCK_50;
	HEX0 <= output0;
	HEX1 <= output1;
	HEX2 <= output2;

	Digit0 : work.htb PORT MAP (number0, output0);
	Digit1 : work.htb PORT MAP (number1, output1);
	Digit2 : work.htb PORT MAP (number2, output2);

	PROCESS (clk)
	BEGIN
		IF (clk = '1') THEN
			count <= count + 1;
		END IF;
	END PROCESS;

	PROCESS (clk)
	BEGIN
		IF (clk = '1') THEN
			IF (count = "00000000000000000000000") THEN
				IF (number0 = "1001") THEN
					number0 <= "0000";

					IF (number1 = "1001") THEN
						number1 <= "0000";

						IF (number2 = "1001") THEN
							number2 <= "0000";
						ELSE
							number2 <= number2 + 1;
						END IF;

					ELSE
						number1 <= number1 + 1;
					END IF;

				ELSE
					number0 <= number0 + 1;
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
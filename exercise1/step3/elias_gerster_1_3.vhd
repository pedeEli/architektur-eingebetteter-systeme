library ieee;
use ieee.std_logic_1164.all;

entity elias_gerster_1_3 is
	port (
		SW   : in  std_logic_vector(3 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end elias_gerster_1_3;

architecture LogicFunction of elias_gerster_1_3 is
begin
	LEDR(4 downto 0) <= "11111" when (SW(0) or SW(1)) = '1' else "00000";
	LEDR(9 downto 5) <= "11111" when (SW(2) or SW(3)) = '1' else "00000";
end LogicFunction;
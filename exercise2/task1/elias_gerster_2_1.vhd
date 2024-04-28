library ieee;
use ieee.std_logic_1164.all;

entity elias_gerster_2_1 is
	port (
		SW   : in  std_logic_vector(9 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end elias_gerster_2_1;

architecture LogicFunction of elias_gerster_2_1 is
begin
	LEDR(9) <= SW(0) when SW(9) = '0' else SW(1);
end LogicFunction;
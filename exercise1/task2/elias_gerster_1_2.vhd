library ieee;
use ieee.std_logic_1164.all;


entity elias_gerster_1_2 is
	port (
		SW   : in  std_logic_vector(9 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end elias_gerster_1_2;

architecture LogicFunction of elias_gerster_1_2 is
begin
	LEDR <= SW;
end LogicFunction;
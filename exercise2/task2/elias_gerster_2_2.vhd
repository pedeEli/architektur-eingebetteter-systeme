library ieee;
use ieee.std_logic_1164.all;

entity elias_gerster_2_2 is
	port (
		SW   : in  std_logic_vector(9 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end elias_gerster_2_2;

architecture LogicFunction of elias_gerster_2_2 is
begin
	LEDR(7 downto 0) <= SW(7 downto 0);
	with SW(9 downto 8) select LEDR(9 downto 8) <=
		SW(1 downto 0) when "00",
		SW(3 downto 2) when "10", 
		SW(5 downto 4) when "01", 
		SW(7 downto 6) when "11"; 
end LogicFunction;
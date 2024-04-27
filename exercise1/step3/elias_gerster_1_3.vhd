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
	process(SW)
	begin
		for i in 0 to 4 loop
			LEDR(i) <= SW(0) or SW(1);
		end loop;
		
		for i in 5 to 9 loop
			LEDR(i) <= SW(2) or SW(3);
		end loop;
	end process;
end LogicFunction;
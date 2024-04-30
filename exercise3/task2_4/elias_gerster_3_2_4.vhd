LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY elias_gerster_3_2_4 IS
	PORT (
		SW   : in  std_logic_vector(1 downto 0);
		LEDR : out std_logic_vector(0 downto 0)
	);
END elias_gerster_3_2_4;


architecture Behaviour of elias_gerster_3_2_4 is
begin
	latch : work.d_latch port map(SW(1), SW(0), LEDR(0));
end Behaviour;
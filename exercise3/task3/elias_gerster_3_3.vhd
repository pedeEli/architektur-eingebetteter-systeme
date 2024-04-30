LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY elias_gerster_3_3 IS
	PORT (
		SW   : in  std_logic_vector(1 downto 0);
		LEDR : out std_logic_vector(0 downto 0)
	);
END elias_gerster_3_3;


architecture Behaviour of elias_gerster_3_3 is
	signal D, Clk : std_logic;
	signal Q_m, Q_s : std_logic;
begin
	D <= SW(0);
	Clk <= SW(1);
	LEDR(0) <= Q_s;

	master : work.d_latch port map(D, not Clk, Q_m);
	slave : work.d_latch port map(Q_m, Clk, Q_s);
end Behaviour;
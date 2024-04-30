LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY elias_gerster_3_2 IS
	PORT (
		Clk, D : IN STD_LOGIC;
		Q : OUT STD_LOGIC
	);
END elias_gerster_3_2;


architecture Structural of elias_gerster_3_2 is
	signal R, S, S_g, R_g, Qa, Qb : std_logic;
	attribute keep : boolean;
	attribute keep of R, S, R_g, S_g, Qa, Qb : signal is true;
begin
	S <= D;
	R <= D;
	S_g <= not (S and Clk);
	R_g <= not (R and Clk);
	Qa <= not (S_g and Qb);
	Qb <= not (R_g and Qa);
	Q <= Qa;
end Structural;
library ieee;
use ieee.std_logic_1164.all;

entity elias_gerster_2_4 is
	port (
		SW   : in  std_logic_vector(8 downto 0);
		LEDR : out std_logic_vector(4 downto 0)
	);
end elias_gerster_2_4;

architecture LogicFunction of elias_gerster_2_4 is
	signal a : std_logic_vector(3 downto 0);
	signal b : std_logic_vector(3 downto 0);
	signal s : std_logic_vector(3 downto 0);
	signal cIn : std_logic;
	signal cOut : std_logic;
	signal c : std_logic_vector(2 downto 0);
begin
	a <= SW(3 downto 0);
	b <= SW(7 downto 4);
	cIn <= SW(8);
	LEDR(3 downto 0) <= s;
	LEDR(4) <= cOut;

	bit0 : work.full_adder port map(a(0), b(0), cIn, s(0), c(0));
	bit1 : work.full_adder port map(a(1), b(1), c(0), s(1), c(1));
	bit2 : work.full_adder port map(a(2), b(2), c(1), s(2), c(2));
	bit3 : work.full_adder port map(a(3), b(3), c(2), s(3), cOut);
end LogicFunction;

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port (
		a    : in  std_logic;
		b    : in  std_logic;
		cIn  : in  std_logic;
		s    : out std_logic;
		cOut : out std_logic
	);
end full_adder;

architecture behaviour of full_adder is
begin
	s <= a xor b xor cIn;
	cOut <= (a and b) or (a and cIn) or (b and cIn);
end behaviour;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ALEY_MULTIPLIER is
	generic(
		WIDTH: integer:=24
);
	port(
		OP_A: in std_logic_vector(WIDTH-1 downto 0);
		OP_B: in std_logic_vector(WIDTH-1 downto 0);
		OP_Q: out std_logic_vector(WIDTH-1 downto 0)
);
end ALEY_MULTIPLIER;

architecture MULTIPLIER_arch of ALEY_MULTIPLIER is
signal S_D: integer;
begin

	S_D <= to_integer(signed(OP_A)) * to_integer(signed(OP_B));
	OP_Q <= std_logic_vector(to_signed(S_D,24));

end MULTIPLIER_arch;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ALEY_ADDER is
	generic(
		WIDTH: integer:=24
);
	port(
		OP_A: in std_logic_vector(WIDTH-1 downto 0);
		OP_B: in std_logic_vector(WIDTH-1 downto 0);
		OP_Q: out std_logic_vector(WIDTH-1 downto 0)
);
end ALEY_ADDER;

architecture ADDER_arch of ALEY_ADDER is
signal S_D: std_logic_vector(WIDTH-1 downto 0);
begin

	S_D <= OP_A + OP_B;
	OP_Q <= S_D;

end ADDER_arch;
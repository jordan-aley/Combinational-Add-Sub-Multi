-- Copyright 2020 by Howard University All rights reserved.
--
-- Manual Testbench for: 
-- Design: Special Topics
-- Name:   Jordan Aley 
--	
-- Date:   1/21/2019
--
-- Description: Test Bench for DS3
-- For Homework #1
--------------------------------------------------------------


LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;

ENTITY tb_ALEY_SUBTRACTOR IS
END;

ARCHITECTURE TESTBENCH OF tb_ALEY_SUBTRACTOR IS

constant WIDTH: integer:= 24
;

---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------

COMPONENT ALEY_SUBTRACTOR 			-- In/out Ports
	generic(
		WIDTH: integer:= 24
);
	port (
		OP_A: in std_logic_vector(WIDTH-1 downto 0);
		OP_B: in std_logic_vector(WIDTH-1 downto 0);
		OP_Q: out std_logic_vector(WIDTH-1 downto 0)
); 
END COMPONENT;

COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"ALEY_SUBTRACTOR_INPUT.txt";   -- Inputs, reset, enr,enl
FILE exo_file : TEXT open read_mode is 	"ALEY_SUBTRACTOR_EXP_OUTPUT.txt";   -- Expected output (binary)
FILE out_file : TEXT open  write_mode is  "ALEY_SUBTRACTOR_dataout_dacus.txt";
FILE xout_file : TEXT open  write_mode is "ALEY_SUBTRACTOR_TestOut_dacus.txt";
FILE hex_out_file : TEXT open  write_mode is "ALEY_SUBTRACTOR_hex_out_dacus.txt";

---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------

  SIGNAL OP_A: STD_LOGIC_VECTOR(WIDTH-1 downto 0):= (others => 'X');
  SIGNAL OP_B: STD_LOGIC_VECTOR(WIDTH-1 downto 0):= (others => 'X');
  SIGNAL CLK: STD_LOGIC;
  SIGNAL OP_Q: STD_LOGIC_VECTOR(WIDTH-1 downto 0):= (others => 'X');
  SIGNAL Exp_Op_Q : STD_LOGIC_VECTOR(WIDTH-1 downto 0):= (others => 'X');
  SIGNAL Test_Out_Q : STD_LOGIC:= 'X';
  SIGNAL LineNumber: integer:=0;

---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components 
---------------------------------------------------------------


U0: CLOCK port map (CLK );
InstALEY_SUBTRACTOR: ALEY_SUBTRACTOR generic map (WIDTH) port map (OP_A, OP_B, OP_Q );

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line, out_line, xout_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;

variable vOP_A  : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vOP_B  : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vOP_Q  : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vExp_Op_Q : std_logic_vector(WIDTH-1 downto 0):= (others => 'X');
variable vTest_Out_Q : std_logic := '0';
variable vlinenumber: integer;

BEGIN

simcomplete := false;

while (not simcomplete) LOOP
  
	if (not endfile(in_file) ) then
		readline(in_file, in_line);
	else
		simcomplete := true;
	end if;

	if (not endfile(exo_file) ) then
		readline(exo_file, exo_line);
	else
		simcomplete := true;
	end if;
	
	if (in_line(1) = '-') then  --Skip comments
		next;
	elsif (in_line(1) = '.')  then  --exit Loop
	  Test_Out_Q <= 'Z';
		simcomplete := true;
	elsif (in_line(1) = '#') then        --Echo comments to out.txt
	  i := 1;
	  while in_line(i) /= '.' LOOP
		comment(i) := in_line(i);
		i := i + 1;
	  end LOOP;

	elsif (exo_line(1) = '-') then  --Skip comments
		next;
	elsif (exo_line(1) = '.')  then  --exit Loop
	  	  Test_Out_Q  <= 'Z';
		   simcomplete := true;
	elsif (exo_line(1) = '#') then        --Echo comments to out.txt
	     i := 1;
	   while exo_line(i) /= '.' LOOP
		 xcomment(i) := exo_line(i);
		 i := i + 1;
	   end LOOP;

	
	  write(out_line, comment);
	  writeline(out_file, out_line);
	  
	  write(xout_line, xcomment);
	  writeline(xout_file, xout_line);

	  
	ELSE      --Begin processing


 		read(in_line, vOP_A );
		OP_A  <= vOP_A;

		read(in_line, vOP_B );
		OP_B  <= vOP_B;

		read(exo_line, vexp_Op_Q );
		read(exo_line, vTest_Out_Q );
		
    vlinenumber :=LineNumber;
    
    write(out_line, vlinenumber);
    write(out_line, STRING'("."));
    write(out_line, STRING'("    "));

	

    CYCLE(1,CLK);
    
    Exp_Op_Q      <= vexp_Op_Q;
    
      
    if (Exp_Op_Q = OP_Q) then
      Test_Out_Q <= '0';
    else
      Test_Out_Q <= 'X';
    end if;

		vOP_Q 	:= OP_Q;
		vTest_Out_Q:= Test_Out_Q;
          		
		write(out_line, vOP_Q, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line,vTest_Out_Q, left, 5);                           --ht is ascii for horizontal tab
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line, vexp_Op_Q, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		writeline(out_file, out_line);
		print(xout_file,    str(LineNumber)& "." & "    " &    str(OP_Q) & "          " &   str(Exp_Op_Q)  & "          " & str(Test_Out_Q) );
	
	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_tb_ALEY_SUBTRACTOR OF tb_ALEY_SUBTRACTOR IS
	FOR TESTBENCH
		FOR InstALEY_SUBTRACTOR: ALEY_SUBTRACTOR
			use entity work.ALEY_SUBTRACTOR(SUBTRACTOR_arch);
		END FOR;
	END FOR;
END;
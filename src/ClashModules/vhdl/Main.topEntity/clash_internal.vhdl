-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.Main_topEntity_types.all;

entity clash_internal is
  port(xs           : in Main_topEntity_types.array_of_Maybe(0 to 63);
       ds           : in Main_topEntity_types.Tup2;
       \c$case_alt\ : out Main_topEntity_types.array_of_Maybe(0 to 63));
end;

architecture structural of clash_internal is
  -- Run-Length-Encoding.hs:19:1-113
  signal i1 : signed(63 downto 0);
  -- Run-Length-Encoding.hs:19:1-113
  signal a  : Main_topEntity_types.Maybe;

begin
  i1 <= ds.Tup2_sel0_signed;

  a <= ds.Tup2_sel1_Maybe;

  -- replace begin
  replaceVec : block
    signal vec_index : integer range 0 to 64-1;
  begin
    vec_index <= to_integer(i1)
    -- pragma translate_off
                 mod 64
    -- pragma translate_on
                 ;

    process(vec_index,xs,a)
      variable ivec : Main_topEntity_types.array_of_Maybe(0 to 63);
    begin
      ivec := xs;
      ivec(vec_index) := a;
      \c$case_alt\ <= ivec;
    end process;
  end block;
  -- replace end


end;


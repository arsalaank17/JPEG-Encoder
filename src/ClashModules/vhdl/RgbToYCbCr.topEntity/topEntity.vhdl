-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.RgbToYCbCr_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk         : in RgbToYCbCr_topEntity_types.clk_System;
       -- reset
       rst         : in RgbToYCbCr_topEntity_types.rst_System;
       i_0         : in signed(31 downto 0);
       i_1         : in signed(31 downto 0);
       i_2         : in signed(31 downto 0);
       ccase_alt_0 : out signed(31 downto 0);
       ccase_alt_1 : out signed(31 downto 0);
       ccase_alt_2 : out signed(31 downto 0));
end;

architecture structural of topEntity is
  -- RgbToYCbCr.hs:13:1-16
  signal r                             : signed(31 downto 0);
  -- RgbToYCbCr.hs:13:1-16
  signal g                             : signed(31 downto 0);
  -- RgbToYCbCr.hs:13:1-16
  signal b                             : signed(31 downto 0);
  signal result                        : signed(31 downto 0);
  signal \c$case_alt\                  : signed(31 downto 0);
  signal \r'\                          : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg\                : std_logic_vector(32 downto 0);
  signal r_0                           : signed(32 downto 0);
  signal result_0                      : signed(31 downto 0);
  signal \c$case_alt_0\                : signed(31 downto 0);
  signal \c$app_arg\                   : std_logic_vector(47 downto 0);
  signal \c$app_arg_0\                 : std_logic;
  signal \c$app_arg_1\                 : std_logic;
  signal \c$app_arg_2\                 : std_logic_vector(16 downto 0);
  signal \c$app_arg_3\                 : std_logic_vector(15 downto 0);
  signal rL                            : std_logic_vector(15 downto 0);
  signal rR                            : std_logic_vector(47 downto 0);
  signal ds3                           : RgbToYCbCr_topEntity_types.Tup2;
  signal result_1                      : signed(31 downto 0);
  signal \c$case_alt_1\                : signed(31 downto 0);
  signal \r'_0\                        : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg_0\              : std_logic_vector(32 downto 0);
  signal r_1                           : signed(32 downto 0);
  signal result_2                      : signed(31 downto 0);
  signal \c$case_alt_2\                : signed(31 downto 0);
  signal \c$app_arg_4\                 : std_logic_vector(47 downto 0);
  signal \c$app_arg_5\                 : std_logic;
  signal \c$app_arg_6\                 : std_logic;
  signal \c$app_arg_7\                 : std_logic_vector(16 downto 0);
  signal \c$app_arg_8\                 : std_logic_vector(15 downto 0);
  signal rL_0                          : std_logic_vector(15 downto 0);
  signal rR_0                          : std_logic_vector(47 downto 0);
  signal ds3_0                         : RgbToYCbCr_topEntity_types.Tup2;
  signal result_3                      : signed(31 downto 0);
  signal \c$case_alt_3\                : signed(31 downto 0);
  signal \r'_1\                        : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg_1\              : std_logic_vector(32 downto 0);
  signal r_2                           : signed(32 downto 0);
  signal result_4                      : signed(31 downto 0);
  signal \c$case_alt_4\                : signed(31 downto 0);
  signal \c$app_arg_9\                 : std_logic_vector(47 downto 0);
  signal \c$app_arg_10\                : std_logic;
  signal \c$app_arg_11\                : std_logic;
  signal \c$app_arg_12\                : std_logic_vector(16 downto 0);
  signal \c$app_arg_13\                : std_logic_vector(15 downto 0);
  signal rL_1                          : std_logic_vector(15 downto 0);
  signal rR_1                          : std_logic_vector(47 downto 0);
  signal ds3_1                         : RgbToYCbCr_topEntity_types.Tup2;
  signal result_5                      : signed(31 downto 0);
  signal \c$case_alt_5\                : signed(31 downto 0);
  signal \r'_2\                        : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg_2\              : std_logic_vector(32 downto 0);
  signal r_3                           : signed(32 downto 0);
  signal result_6                      : signed(31 downto 0);
  signal \c$case_alt_6\                : signed(31 downto 0);
  signal \c$app_arg_14\                : std_logic_vector(47 downto 0);
  signal \c$app_arg_15\                : std_logic;
  signal \c$app_arg_16\                : std_logic;
  signal \c$app_arg_17\                : std_logic_vector(16 downto 0);
  signal \c$app_arg_18\                : std_logic_vector(15 downto 0);
  signal rL_2                          : std_logic_vector(15 downto 0);
  signal rR_2                          : std_logic_vector(47 downto 0);
  signal ds3_2                         : RgbToYCbCr_topEntity_types.Tup2;
  signal result_7                      : signed(31 downto 0);
  signal \c$case_alt_7\                : signed(31 downto 0);
  signal \r'_3\                        : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg_3\              : std_logic_vector(32 downto 0);
  signal r_4                           : signed(32 downto 0);
  signal result_8                      : signed(31 downto 0);
  signal \c$case_alt_8\                : signed(31 downto 0);
  signal \c$app_arg_19\                : std_logic_vector(47 downto 0);
  signal \c$app_arg_20\                : std_logic;
  signal \c$app_arg_21\                : std_logic;
  signal \c$app_arg_22\                : std_logic_vector(16 downto 0);
  signal \c$app_arg_23\                : std_logic_vector(15 downto 0);
  signal rL_3                          : std_logic_vector(15 downto 0);
  signal rR_3                          : std_logic_vector(47 downto 0);
  signal ds3_3                         : RgbToYCbCr_topEntity_types.Tup2;
  signal result_9                      : signed(31 downto 0);
  signal \c$case_alt_9\                : signed(31 downto 0);
  signal \r'_4\                        : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg_4\              : std_logic_vector(32 downto 0);
  signal r_5                           : signed(32 downto 0);
  signal result_10                     : signed(31 downto 0);
  signal \c$case_alt_10\               : signed(31 downto 0);
  signal \c$app_arg_24\                : std_logic_vector(47 downto 0);
  signal \c$app_arg_25\                : std_logic;
  signal \c$app_arg_26\                : std_logic;
  signal \c$app_arg_27\                : std_logic_vector(16 downto 0);
  signal \c$app_arg_28\                : std_logic_vector(15 downto 0);
  signal rL_4                          : std_logic_vector(15 downto 0);
  signal rR_4                          : std_logic_vector(47 downto 0);
  signal ds3_4                         : RgbToYCbCr_topEntity_types.Tup2;
  signal result_11                     : signed(31 downto 0);
  signal \c$case_alt_11\               : signed(31 downto 0);
  signal \r'_5\                        : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg_5\              : std_logic_vector(32 downto 0);
  signal r_6                           : signed(32 downto 0);
  signal result_12                     : signed(31 downto 0);
  signal \c$case_alt_12\               : signed(31 downto 0);
  signal \c$app_arg_29\                : std_logic_vector(47 downto 0);
  signal \c$app_arg_30\                : std_logic;
  signal \c$app_arg_31\                : std_logic;
  signal \c$app_arg_32\                : std_logic_vector(16 downto 0);
  signal \c$app_arg_33\                : std_logic_vector(15 downto 0);
  signal rL_5                          : std_logic_vector(15 downto 0);
  signal rR_5                          : std_logic_vector(47 downto 0);
  signal ds3_5                         : RgbToYCbCr_topEntity_types.Tup2;
  signal result_13                     : signed(31 downto 0);
  signal \c$case_alt_13\               : signed(31 downto 0);
  signal \r'_6\                        : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg_6\              : std_logic_vector(32 downto 0);
  signal r_7                           : signed(32 downto 0);
  signal result_14                     : signed(31 downto 0);
  signal \c$case_alt_14\               : signed(31 downto 0);
  signal \c$app_arg_34\                : std_logic_vector(47 downto 0);
  signal \c$app_arg_35\                : std_logic;
  signal \c$app_arg_36\                : std_logic;
  signal \c$app_arg_37\                : std_logic_vector(16 downto 0);
  signal \c$app_arg_38\                : std_logic_vector(15 downto 0);
  signal rL_6                          : std_logic_vector(15 downto 0);
  signal rR_6                          : std_logic_vector(47 downto 0);
  signal ds3_6                         : RgbToYCbCr_topEntity_types.Tup2;
  signal result_15                     : signed(31 downto 0);
  signal \c$case_alt_15\               : signed(31 downto 0);
  signal \r'_7\                        : std_logic_vector(31 downto 0);
  signal \c$r'_app_arg_7\              : std_logic_vector(32 downto 0);
  signal r_8                           : signed(32 downto 0);
  signal result_16                     : signed(31 downto 0);
  signal \c$case_alt_16\               : signed(31 downto 0);
  signal \c$app_arg_39\                : std_logic_vector(47 downto 0);
  signal \c$app_arg_40\                : std_logic;
  signal \c$app_arg_41\                : std_logic;
  signal \c$app_arg_42\                : std_logic_vector(16 downto 0);
  signal \c$app_arg_43\                : std_logic_vector(15 downto 0);
  signal rL_7                          : std_logic_vector(15 downto 0);
  signal rR_7                          : std_logic_vector(47 downto 0);
  signal ds3_7                         : RgbToYCbCr_topEntity_types.Tup2;
  signal i                             : RgbToYCbCr_topEntity_types.Tup3;
  signal result_selection_res          : boolean;
  signal \c$bv\                        : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res\    : std_logic_vector(1 downto 0);
  signal \c$bv_0\                      : std_logic_vector(31 downto 0);
  signal \c$bv_1\                      : std_logic_vector(31 downto 0);
  signal \r'_projection\               : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_0        : boolean;
  signal \c$case_alt_selection_res_0\  : boolean;
  signal \c$shI\                       : signed(63 downto 0);
  signal \c$bv_2\                      : std_logic_vector(47 downto 0);
  signal \c$bv_3\                      : std_logic_vector(63 downto 0);
  signal result_selection_res_1        : boolean;
  signal \c$bv_4\                      : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res_1\  : std_logic_vector(1 downto 0);
  signal \c$bv_5\                      : std_logic_vector(31 downto 0);
  signal \c$bv_6\                      : std_logic_vector(31 downto 0);
  signal \r'_projection_0\             : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_2        : boolean;
  signal \c$case_alt_selection_res_2\  : boolean;
  signal \c$shI_0\                     : signed(63 downto 0);
  signal \c$bv_7\                      : std_logic_vector(47 downto 0);
  signal \c$bv_8\                      : std_logic_vector(63 downto 0);
  signal result_selection_res_3        : boolean;
  signal \c$bv_9\                      : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res_3\  : boolean;
  signal \c$bv_10\                     : std_logic_vector(31 downto 0);
  signal \r'_projection_1\             : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_4        : boolean;
  signal \c$case_alt_selection_res_4\  : boolean;
  signal \c$shI_1\                     : signed(63 downto 0);
  signal \c$bv_11\                     : std_logic_vector(47 downto 0);
  signal \c$bv_12\                     : std_logic_vector(63 downto 0);
  signal result_selection_res_5        : boolean;
  signal \c$bv_13\                     : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res_5\  : boolean;
  signal \c$bv_14\                     : std_logic_vector(31 downto 0);
  signal \c$bv_15\                     : std_logic_vector(31 downto 0);
  signal \r'_projection_2\             : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_6        : boolean;
  signal \c$case_alt_selection_res_6\  : boolean;
  signal \c$shI_2\                     : signed(63 downto 0);
  signal \c$bv_16\                     : std_logic_vector(47 downto 0);
  signal \c$bv_17\                     : std_logic_vector(63 downto 0);
  signal result_selection_res_7        : boolean;
  signal \c$bv_18\                     : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res_7\  : std_logic_vector(1 downto 0);
  signal \c$bv_19\                     : std_logic_vector(31 downto 0);
  signal \c$bv_20\                     : std_logic_vector(31 downto 0);
  signal \r'_projection_3\             : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_8        : boolean;
  signal \c$case_alt_selection_res_8\  : boolean;
  signal \c$shI_3\                     : signed(63 downto 0);
  signal \c$bv_21\                     : std_logic_vector(47 downto 0);
  signal \c$bv_22\                     : std_logic_vector(63 downto 0);
  signal result_selection_res_9        : boolean;
  signal \c$bv_23\                     : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res_9\  : std_logic_vector(1 downto 0);
  signal \c$bv_24\                     : std_logic_vector(31 downto 0);
  signal \r'_projection_4\             : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_10       : boolean;
  signal \c$case_alt_selection_res_10\ : boolean;
  signal \c$shI_4\                     : signed(63 downto 0);
  signal \c$bv_25\                     : std_logic_vector(47 downto 0);
  signal \c$bv_26\                     : std_logic_vector(63 downto 0);
  signal result_selection_res_11       : boolean;
  signal \c$bv_27\                     : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res_11\ : boolean;
  signal \c$bv_28\                     : std_logic_vector(31 downto 0);
  signal \c$bv_29\                     : std_logic_vector(31 downto 0);
  signal \r'_projection_5\             : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_12       : boolean;
  signal \c$case_alt_selection_res_12\ : boolean;
  signal \c$shI_5\                     : signed(63 downto 0);
  signal \c$bv_30\                     : std_logic_vector(47 downto 0);
  signal \c$bv_31\                     : std_logic_vector(63 downto 0);
  signal result_selection_res_13       : boolean;
  signal \c$bv_32\                     : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res_13\ : boolean;
  signal \c$bv_33\                     : std_logic_vector(31 downto 0);
  signal \c$bv_34\                     : std_logic_vector(31 downto 0);
  signal \r'_projection_6\             : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_14       : boolean;
  signal \c$case_alt_selection_res_14\ : boolean;
  signal \c$shI_6\                     : signed(63 downto 0);
  signal \c$bv_35\                     : std_logic_vector(47 downto 0);
  signal \c$bv_36\                     : std_logic_vector(63 downto 0);
  signal result_selection_res_15       : boolean;
  signal \c$bv_37\                     : std_logic_vector(31 downto 0);
  signal \c$case_alt_selection_res_15\ : boolean;
  signal \c$bv_38\                     : std_logic_vector(31 downto 0);
  signal \r'_projection_7\             : RgbToYCbCr_topEntity_types.Tup2_0;
  signal result_selection_res_16       : boolean;
  signal \c$case_alt_selection_res_16\ : boolean;
  signal \c$shI_7\                     : signed(63 downto 0);
  signal \c$bv_39\                     : std_logic_vector(47 downto 0);
  signal \c$bv_40\                     : std_logic_vector(63 downto 0);
  signal ccase_alt                     : RgbToYCbCr_topEntity_types.Tup3;

begin
  i <= ( Tup3_sel0_signed_0 => i_0
       , Tup3_sel1_signed_1 => i_1
       , Tup3_sel2_signed_2 => i_2 );

  r <= i.Tup3_sel0_signed_0;

  g <= i.Tup3_sel1_signed_1;

  b <= i.Tup3_sel2_signed_2;

  ccase_alt <= ( Tup3_sel0_signed_0 => result_11
               , Tup3_sel1_signed_1 => result_5
               , Tup3_sel2_signed_2 => result );

  \c$bv\ <= (\r'\);

  result_selection_res <= (( \c$r'_app_arg\(\c$r'_app_arg\'high) ) xor ( \c$bv\(\c$bv\'high) )) = '0';

  result <= signed(\r'\) when result_selection_res else
            \c$case_alt\;

  \c$bv_0\ <= ((std_logic_vector(result_1)));

  \c$bv_1\ <= ((std_logic_vector(result_0)));

  \c$case_alt_selection_res\ <= std_logic_vector'(std_logic_vector'((std_logic_vector'(0 => ( \c$bv_0\(\c$bv_0\'high) )))) & std_logic_vector'((std_logic_vector'(0 => ( \c$bv_1\(\c$bv_1\'high) )))));

  with (\c$case_alt_selection_res\) select
    \c$case_alt\ <= signed'(-x"80000000") when "10",
                    to_signed(2147483647,32) when others;

  \r'_projection\ <= (\c$r'_app_arg\(\c$r'_app_arg\'high downto 32),\c$r'_app_arg\(32-1 downto 0));

  \r'\ <= \r'_projection\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg\ <= (std_logic_vector(r_0));

  r_0 <= resize(result_1,33) - resize(result_0,33);

  result_selection_res_0 <= ((not \c$app_arg_1\) or \c$app_arg_0\) = '1';

  result_0 <= signed((std_logic_vector(resize(unsigned(\c$app_arg\),32)))) when result_selection_res_0 else
              \c$case_alt_0\;

  \c$case_alt_selection_res_0\ <= ( \c$app_arg_3\(\c$app_arg_3\'high) ) = '0';

  \c$case_alt_0\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_0\ else
                    signed'(-x"80000000");

  \c$shI\ <= to_signed(16,64);

  capp_arg_shiftR : block
    signal sh : natural;
  begin
    sh <=
        -- pragma translate_off
        natural'high when (\c$shI\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI\);
    \c$app_arg\ <= std_logic_vector(shift_right(unsigned(rR),sh))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_0\ <= and_reduce(\c$app_arg_2\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_1\ <= or_reduce(\c$app_arg_2\);
  end block;
  -- reduceOr end

  \c$bv_2\ <= (rR);

  \c$app_arg_2\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_2\(\c$bv_2\'high) ))))) & std_logic_vector'(\c$app_arg_3\)));

  \c$app_arg_3\ <= rL;

  rL <= ds3.Tup2_sel0_std_logic_vector_0;

  rR <= ds3.Tup2_sel1_std_logic_vector_1;

  \c$bv_3\ <= ((std_logic_vector((to_signed(5328,32) * b))));

  ds3 <= (\c$bv_3\(\c$bv_3\'high downto 48),\c$bv_3\(48-1 downto 0));

  \c$bv_4\ <= (\r'_0\);

  result_selection_res_1 <= (( \c$r'_app_arg_0\(\c$r'_app_arg_0\'high) ) xor ( \c$bv_4\(\c$bv_4\'high) )) = '0';

  result_1 <= signed(\r'_0\) when result_selection_res_1 else
              \c$case_alt_1\;

  \c$bv_5\ <= ((std_logic_vector(result_3)));

  \c$bv_6\ <= ((std_logic_vector(result_2)));

  \c$case_alt_selection_res_1\ <= std_logic_vector'(std_logic_vector'((std_logic_vector'(0 => ( \c$bv_5\(\c$bv_5\'high) )))) & std_logic_vector'((std_logic_vector'(0 => ( \c$bv_6\(\c$bv_6\'high) )))));

  with (\c$case_alt_selection_res_1\) select
    \c$case_alt_1\ <= signed'(-x"80000000") when "10",
                      to_signed(2147483647,32) when others;

  \r'_projection_0\ <= (\c$r'_app_arg_0\(\c$r'_app_arg_0\'high downto 32),\c$r'_app_arg_0\(32-1 downto 0));

  \r'_0\ <= \r'_projection_0\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg_0\ <= (std_logic_vector(r_1));

  r_1 <= resize(result_3,33) - resize(result_2,33);

  result_selection_res_2 <= ((not \c$app_arg_6\) or \c$app_arg_5\) = '1';

  result_2 <= signed((std_logic_vector(resize(unsigned(\c$app_arg_4\),32)))) when result_selection_res_2 else
              \c$case_alt_2\;

  \c$case_alt_selection_res_2\ <= ( \c$app_arg_8\(\c$app_arg_8\'high) ) = '0';

  \c$case_alt_2\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_2\ else
                    signed'(-x"80000000");

  \c$shI_0\ <= to_signed(16,64);

  capp_arg_4_shiftR : block
    signal sh_0 : natural;
  begin
    sh_0 <=
        -- pragma translate_off
        natural'high when (\c$shI_0\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_0\);
    \c$app_arg_4\ <= std_logic_vector(shift_right(unsigned(rR_0),sh_0))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd_0 : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_5\ <= and_reduce(\c$app_arg_7\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr_0 : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_6\ <= or_reduce(\c$app_arg_7\);
  end block;
  -- reduceOr end

  \c$bv_7\ <= (rR_0);

  \c$app_arg_7\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_7\(\c$bv_7\'high) ))))) & std_logic_vector'(\c$app_arg_8\)));

  \c$app_arg_8\ <= rL_0;

  rL_0 <= ds3_0.Tup2_sel0_std_logic_vector_0;

  rR_0 <= ds3_0.Tup2_sel1_std_logic_vector_1;

  \c$bv_8\ <= ((std_logic_vector((to_signed(27439,32) * g))));

  ds3_0 <= (\c$bv_8\(\c$bv_8\'high downto 48),\c$bv_8\(48-1 downto 0));

  \c$bv_9\ <= (\r'_1\);

  result_selection_res_3 <= (( \c$r'_app_arg_1\(\c$r'_app_arg_1\'high) ) xor ( \c$bv_9\(\c$bv_9\'high) )) = '0';

  result_3 <= signed(\r'_1\) when result_selection_res_3 else
              \c$case_alt_3\;

  \c$bv_10\ <= ((std_logic_vector(result_4)));

  \c$case_alt_selection_res_3\ <= ('0' and ( \c$bv_10\(\c$bv_10\'high) )) = '0';

  \c$case_alt_3\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_3\ else
                    signed'(-x"80000000");

  \r'_projection_1\ <= (\c$r'_app_arg_1\(\c$r'_app_arg_1\'high downto 32),\c$r'_app_arg_1\(32-1 downto 0));

  \r'_1\ <= \r'_projection_1\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg_1\ <= (std_logic_vector(r_2));

  r_2 <= resize(to_signed(8388608,32),33) + resize(result_4,33);

  result_selection_res_4 <= ((not \c$app_arg_11\) or \c$app_arg_10\) = '1';

  result_4 <= signed((std_logic_vector(resize(unsigned(\c$app_arg_9\),32)))) when result_selection_res_4 else
              \c$case_alt_4\;

  \c$case_alt_selection_res_4\ <= ( \c$app_arg_13\(\c$app_arg_13\'high) ) = '0';

  \c$case_alt_4\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_4\ else
                    signed'(-x"80000000");

  \c$shI_1\ <= to_signed(16,64);

  capp_arg_9_shiftR : block
    signal sh_1 : natural;
  begin
    sh_1 <=
        -- pragma translate_off
        natural'high when (\c$shI_1\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_1\);
    \c$app_arg_9\ <= std_logic_vector(shift_right(unsigned(rR_1),sh_1))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd_1 : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_10\ <= and_reduce(\c$app_arg_12\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr_1 : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_11\ <= or_reduce(\c$app_arg_12\);
  end block;
  -- reduceOr end

  \c$bv_11\ <= (rR_1);

  \c$app_arg_12\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_11\(\c$bv_11\'high) ))))) & std_logic_vector'(\c$app_arg_13\)));

  \c$app_arg_13\ <= rL_1;

  rL_1 <= ds3_1.Tup2_sel0_std_logic_vector_0;

  rR_1 <= ds3_1.Tup2_sel1_std_logic_vector_1;

  \c$bv_12\ <= ((std_logic_vector((to_signed(32768,32) * r))));

  ds3_1 <= (\c$bv_12\(\c$bv_12\'high downto 48),\c$bv_12\(48-1 downto 0));

  \c$bv_13\ <= (\r'_2\);

  result_selection_res_5 <= (( \c$r'_app_arg_2\(\c$r'_app_arg_2\'high) ) xor ( \c$bv_13\(\c$bv_13\'high) )) = '0';

  result_5 <= signed(\r'_2\) when result_selection_res_5 else
              \c$case_alt_5\;

  \c$bv_14\ <= ((std_logic_vector(result_7)));

  \c$bv_15\ <= ((std_logic_vector(result_6)));

  \c$case_alt_selection_res_5\ <= (( \c$bv_14\(\c$bv_14\'high) ) and ( \c$bv_15\(\c$bv_15\'high) )) = '0';

  \c$case_alt_5\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_5\ else
                    signed'(-x"80000000");

  \r'_projection_2\ <= (\c$r'_app_arg_2\(\c$r'_app_arg_2\'high downto 32),\c$r'_app_arg_2\(32-1 downto 0));

  \r'_2\ <= \r'_projection_2\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg_2\ <= (std_logic_vector(r_3));

  r_3 <= resize(result_7,33) + resize(result_6,33);

  result_selection_res_6 <= ((not \c$app_arg_16\) or \c$app_arg_15\) = '1';

  result_6 <= signed((std_logic_vector(resize(unsigned(\c$app_arg_14\),32)))) when result_selection_res_6 else
              \c$case_alt_6\;

  \c$case_alt_selection_res_6\ <= ( \c$app_arg_18\(\c$app_arg_18\'high) ) = '0';

  \c$case_alt_6\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_6\ else
                    signed'(-x"80000000");

  \c$shI_2\ <= to_signed(16,64);

  capp_arg_14_shiftR : block
    signal sh_2 : natural;
  begin
    sh_2 <=
        -- pragma translate_off
        natural'high when (\c$shI_2\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_2\);
    \c$app_arg_14\ <= std_logic_vector(shift_right(unsigned(rR_2),sh_2))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd_2 : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_15\ <= and_reduce(\c$app_arg_17\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr_2 : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_16\ <= or_reduce(\c$app_arg_17\);
  end block;
  -- reduceOr end

  \c$bv_16\ <= (rR_2);

  \c$app_arg_17\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_16\(\c$bv_16\'high) ))))) & std_logic_vector'(\c$app_arg_18\)));

  \c$app_arg_18\ <= rL_2;

  rL_2 <= ds3_2.Tup2_sel0_std_logic_vector_0;

  rR_2 <= ds3_2.Tup2_sel1_std_logic_vector_1;

  \c$bv_17\ <= ((std_logic_vector((to_signed(32768,32) * b))));

  ds3_2 <= (\c$bv_17\(\c$bv_17\'high downto 48),\c$bv_17\(48-1 downto 0));

  \c$bv_18\ <= (\r'_3\);

  result_selection_res_7 <= (( \c$r'_app_arg_3\(\c$r'_app_arg_3\'high) ) xor ( \c$bv_18\(\c$bv_18\'high) )) = '0';

  result_7 <= signed(\r'_3\) when result_selection_res_7 else
              \c$case_alt_7\;

  \c$bv_19\ <= ((std_logic_vector(result_9)));

  \c$bv_20\ <= ((std_logic_vector(result_8)));

  \c$case_alt_selection_res_7\ <= std_logic_vector'(std_logic_vector'((std_logic_vector'(0 => ( \c$bv_19\(\c$bv_19\'high) )))) & std_logic_vector'((std_logic_vector'(0 => ( \c$bv_20\(\c$bv_20\'high) )))));

  with (\c$case_alt_selection_res_7\) select
    \c$case_alt_7\ <= signed'(-x"80000000") when "10",
                      to_signed(2147483647,32) when others;

  \r'_projection_3\ <= (\c$r'_app_arg_3\(\c$r'_app_arg_3\'high downto 32),\c$r'_app_arg_3\(32-1 downto 0));

  \r'_3\ <= \r'_projection_3\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg_3\ <= (std_logic_vector(r_4));

  r_4 <= resize(result_9,33) - resize(result_8,33);

  result_selection_res_8 <= ((not \c$app_arg_21\) or \c$app_arg_20\) = '1';

  result_8 <= signed((std_logic_vector(resize(unsigned(\c$app_arg_19\),32)))) when result_selection_res_8 else
              \c$case_alt_8\;

  \c$case_alt_selection_res_8\ <= ( \c$app_arg_23\(\c$app_arg_23\'high) ) = '0';

  \c$case_alt_8\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_8\ else
                    signed'(-x"80000000");

  \c$shI_3\ <= to_signed(16,64);

  capp_arg_19_shiftR : block
    signal sh_3 : natural;
  begin
    sh_3 <=
        -- pragma translate_off
        natural'high when (\c$shI_3\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_3\);
    \c$app_arg_19\ <= std_logic_vector(shift_right(unsigned(rR_3),sh_3))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd_3 : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_20\ <= and_reduce(\c$app_arg_22\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr_3 : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_21\ <= or_reduce(\c$app_arg_22\);
  end block;
  -- reduceOr end

  \c$bv_21\ <= (rR_3);

  \c$app_arg_22\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_21\(\c$bv_21\'high) ))))) & std_logic_vector'(\c$app_arg_23\)));

  \c$app_arg_23\ <= rL_3;

  rL_3 <= ds3_3.Tup2_sel0_std_logic_vector_0;

  rR_3 <= ds3_3.Tup2_sel1_std_logic_vector_1;

  \c$bv_22\ <= ((std_logic_vector((to_signed(21709,32) * g))));

  ds3_3 <= (\c$bv_22\(\c$bv_22\'high downto 48),\c$bv_22\(48-1 downto 0));

  \c$bv_23\ <= (\r'_4\);

  result_selection_res_9 <= (( \c$r'_app_arg_4\(\c$r'_app_arg_4\'high) ) xor ( \c$bv_23\(\c$bv_23\'high) )) = '0';

  result_9 <= signed(\r'_4\) when result_selection_res_9 else
              \c$case_alt_9\;

  \c$bv_24\ <= ((std_logic_vector(result_10)));

  \c$case_alt_selection_res_9\ <= std_logic_vector'(std_logic_vector'(std_logic_vector'("0")) & std_logic_vector'((std_logic_vector'(0 => ( \c$bv_24\(\c$bv_24\'high) )))));

  with (\c$case_alt_selection_res_9\) select
    \c$case_alt_9\ <= signed'(-x"80000000") when "10",
                      to_signed(2147483647,32) when others;

  \r'_projection_4\ <= (\c$r'_app_arg_4\(\c$r'_app_arg_4\'high downto 32),\c$r'_app_arg_4\(32-1 downto 0));

  \r'_4\ <= \r'_projection_4\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg_4\ <= (std_logic_vector(r_5));

  r_5 <= resize(to_signed(8388608,32),33) - resize(result_10,33);

  result_selection_res_10 <= ((not \c$app_arg_26\) or \c$app_arg_25\) = '1';

  result_10 <= signed((std_logic_vector(resize(unsigned(\c$app_arg_24\),32)))) when result_selection_res_10 else
               \c$case_alt_10\;

  \c$case_alt_selection_res_10\ <= ( \c$app_arg_28\(\c$app_arg_28\'high) ) = '0';

  \c$case_alt_10\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_10\ else
                     signed'(-x"80000000");

  \c$shI_4\ <= to_signed(16,64);

  capp_arg_24_shiftR : block
    signal sh_4 : natural;
  begin
    sh_4 <=
        -- pragma translate_off
        natural'high when (\c$shI_4\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_4\);
    \c$app_arg_24\ <= std_logic_vector(shift_right(unsigned(rR_4),sh_4))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd_4 : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_25\ <= and_reduce(\c$app_arg_27\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr_4 : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_26\ <= or_reduce(\c$app_arg_27\);
  end block;
  -- reduceOr end

  \c$bv_25\ <= (rR_4);

  \c$app_arg_27\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_25\(\c$bv_25\'high) ))))) & std_logic_vector'(\c$app_arg_28\)));

  \c$app_arg_28\ <= rL_4;

  rL_4 <= ds3_4.Tup2_sel0_std_logic_vector_0;

  rR_4 <= ds3_4.Tup2_sel1_std_logic_vector_1;

  \c$bv_26\ <= ((std_logic_vector((to_signed(11058,32) * r))));

  ds3_4 <= (\c$bv_26\(\c$bv_26\'high downto 48),\c$bv_26\(48-1 downto 0));

  \c$bv_27\ <= (\r'_5\);

  result_selection_res_11 <= (( \c$r'_app_arg_5\(\c$r'_app_arg_5\'high) ) xor ( \c$bv_27\(\c$bv_27\'high) )) = '0';

  result_11 <= signed(\r'_5\) when result_selection_res_11 else
               \c$case_alt_11\;

  \c$bv_28\ <= ((std_logic_vector(result_13)));

  \c$bv_29\ <= ((std_logic_vector(result_12)));

  \c$case_alt_selection_res_11\ <= (( \c$bv_28\(\c$bv_28\'high) ) and ( \c$bv_29\(\c$bv_29\'high) )) = '0';

  \c$case_alt_11\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_11\ else
                     signed'(-x"80000000");

  \r'_projection_5\ <= (\c$r'_app_arg_5\(\c$r'_app_arg_5\'high downto 32),\c$r'_app_arg_5\(32-1 downto 0));

  \r'_5\ <= \r'_projection_5\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg_5\ <= (std_logic_vector(r_6));

  r_6 <= resize(result_13,33) + resize(result_12,33);

  result_selection_res_12 <= ((not \c$app_arg_31\) or \c$app_arg_30\) = '1';

  result_12 <= signed((std_logic_vector(resize(unsigned(\c$app_arg_29\),32)))) when result_selection_res_12 else
               \c$case_alt_12\;

  \c$case_alt_selection_res_12\ <= ( \c$app_arg_33\(\c$app_arg_33\'high) ) = '0';

  \c$case_alt_12\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_12\ else
                     signed'(-x"80000000");

  \c$shI_5\ <= to_signed(16,64);

  capp_arg_29_shiftR : block
    signal sh_5 : natural;
  begin
    sh_5 <=
        -- pragma translate_off
        natural'high when (\c$shI_5\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_5\);
    \c$app_arg_29\ <= std_logic_vector(shift_right(unsigned(rR_5),sh_5))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd_5 : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_30\ <= and_reduce(\c$app_arg_32\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr_5 : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_31\ <= or_reduce(\c$app_arg_32\);
  end block;
  -- reduceOr end

  \c$bv_30\ <= (rR_5);

  \c$app_arg_32\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_30\(\c$bv_30\'high) ))))) & std_logic_vector'(\c$app_arg_33\)));

  \c$app_arg_33\ <= rL_5;

  rL_5 <= ds3_5.Tup2_sel0_std_logic_vector_0;

  rR_5 <= ds3_5.Tup2_sel1_std_logic_vector_1;

  \c$bv_31\ <= ((std_logic_vector((to_signed(7471,32) * b))));

  ds3_5 <= (\c$bv_31\(\c$bv_31\'high downto 48),\c$bv_31\(48-1 downto 0));

  \c$bv_32\ <= (\r'_6\);

  result_selection_res_13 <= (( \c$r'_app_arg_6\(\c$r'_app_arg_6\'high) ) xor ( \c$bv_32\(\c$bv_32\'high) )) = '0';

  result_13 <= signed(\r'_6\) when result_selection_res_13 else
               \c$case_alt_13\;

  \c$bv_33\ <= ((std_logic_vector(result_15)));

  \c$bv_34\ <= ((std_logic_vector(result_14)));

  \c$case_alt_selection_res_13\ <= (( \c$bv_33\(\c$bv_33\'high) ) and ( \c$bv_34\(\c$bv_34\'high) )) = '0';

  \c$case_alt_13\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_13\ else
                     signed'(-x"80000000");

  \r'_projection_6\ <= (\c$r'_app_arg_6\(\c$r'_app_arg_6\'high downto 32),\c$r'_app_arg_6\(32-1 downto 0));

  \r'_6\ <= \r'_projection_6\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg_6\ <= (std_logic_vector(r_7));

  r_7 <= resize(result_15,33) + resize(result_14,33);

  result_selection_res_14 <= ((not \c$app_arg_36\) or \c$app_arg_35\) = '1';

  result_14 <= signed((std_logic_vector(resize(unsigned(\c$app_arg_34\),32)))) when result_selection_res_14 else
               \c$case_alt_14\;

  \c$case_alt_selection_res_14\ <= ( \c$app_arg_38\(\c$app_arg_38\'high) ) = '0';

  \c$case_alt_14\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_14\ else
                     signed'(-x"80000000");

  \c$shI_6\ <= to_signed(16,64);

  capp_arg_34_shiftR : block
    signal sh_6 : natural;
  begin
    sh_6 <=
        -- pragma translate_off
        natural'high when (\c$shI_6\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_6\);
    \c$app_arg_34\ <= std_logic_vector(shift_right(unsigned(rR_6),sh_6))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd_6 : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_35\ <= and_reduce(\c$app_arg_37\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr_6 : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_36\ <= or_reduce(\c$app_arg_37\);
  end block;
  -- reduceOr end

  \c$bv_35\ <= (rR_6);

  \c$app_arg_37\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_35\(\c$bv_35\'high) ))))) & std_logic_vector'(\c$app_arg_38\)));

  \c$app_arg_38\ <= rL_6;

  rL_6 <= ds3_6.Tup2_sel0_std_logic_vector_0;

  rR_6 <= ds3_6.Tup2_sel1_std_logic_vector_1;

  \c$bv_36\ <= ((std_logic_vector((to_signed(38469,32) * g))));

  ds3_6 <= (\c$bv_36\(\c$bv_36\'high downto 48),\c$bv_36\(48-1 downto 0));

  \c$bv_37\ <= (\r'_7\);

  result_selection_res_15 <= (( \c$r'_app_arg_7\(\c$r'_app_arg_7\'high) ) xor ( \c$bv_37\(\c$bv_37\'high) )) = '0';

  result_15 <= signed(\r'_7\) when result_selection_res_15 else
               \c$case_alt_15\;

  \c$bv_38\ <= ((std_logic_vector(result_16)));

  \c$case_alt_selection_res_15\ <= ('0' and ( \c$bv_38\(\c$bv_38\'high) )) = '0';

  \c$case_alt_15\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_15\ else
                     signed'(-x"80000000");

  \r'_projection_7\ <= (\c$r'_app_arg_7\(\c$r'_app_arg_7\'high downto 32),\c$r'_app_arg_7\(32-1 downto 0));

  \r'_7\ <= \r'_projection_7\.Tup2_0_sel1_std_logic_vector_1;

  \c$r'_app_arg_7\ <= (std_logic_vector(r_8));

  r_8 <= resize(to_signed(0,32),33) + resize(result_16,33);

  result_selection_res_16 <= ((not \c$app_arg_41\) or \c$app_arg_40\) = '1';

  result_16 <= signed((std_logic_vector(resize(unsigned(\c$app_arg_39\),32)))) when result_selection_res_16 else
               \c$case_alt_16\;

  \c$case_alt_selection_res_16\ <= ( \c$app_arg_43\(\c$app_arg_43\'high) ) = '0';

  \c$case_alt_16\ <= to_signed(2147483647,32) when \c$case_alt_selection_res_16\ else
                     signed'(-x"80000000");

  \c$shI_7\ <= to_signed(16,64);

  capp_arg_39_shiftR : block
    signal sh_7 : natural;
  begin
    sh_7 <=
        -- pragma translate_off
        natural'high when (\c$shI_7\(64-1 downto 31) /= 0) else
        -- pragma translate_on
        to_integer(\c$shI_7\);
    \c$app_arg_39\ <= std_logic_vector(shift_right(unsigned(rR_7),sh_7))
        -- pragma translate_off
        when (to_signed(16,64) >= 0) else (others => 'X')
        -- pragma translate_on
        ;
  end block;

  -- reduceAnd begin,

  reduceAnd_7 : block
    function and_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '1';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := and_reduce (argi (argi'left downto half));
          lower  := and_reduce (argi (half - 1 downto argi'right));
          result := upper and lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_40\ <= and_reduce(\c$app_arg_42\);
  end block;
  -- reduceAnd end

  -- reduceOr begin
  reduceOr_7 : block
    function or_reduce (arg : std_logic_vector) return std_logic is
      variable upper, lower : std_logic;
      variable half         : integer;
      variable argi         : std_logic_vector (arg'length - 1 downto 0);
      variable result       : std_logic;
    begin
      if (arg'length < 1) then
        result := '0';
      else
        argi := arg;
        if (argi'length = 1) then
          result := argi(argi'left);
        else
          half   := (argi'length + 1) / 2; -- lsb-biased tree
          upper  := or_reduce (argi (argi'left downto half));
          lower  := or_reduce (argi (half - 1 downto argi'right));
          result := upper or lower;
        end if;
      end if;
      return result;
    end;
  begin
    \c$app_arg_41\ <= or_reduce(\c$app_arg_42\);
  end block;
  -- reduceOr end

  \c$bv_39\ <= (rR_7);

  \c$app_arg_42\ <= (std_logic_vector'(std_logic_vector'(((std_logic_vector'(0 => ( \c$bv_39\(\c$bv_39\'high) ))))) & std_logic_vector'(\c$app_arg_43\)));

  \c$app_arg_43\ <= rL_7;

  rL_7 <= ds3_7.Tup2_sel0_std_logic_vector_0;

  rR_7 <= ds3_7.Tup2_sel1_std_logic_vector_1;

  \c$bv_40\ <= ((std_logic_vector((to_signed(19595,32) * r))));

  ds3_7 <= (\c$bv_40\(\c$bv_40\'high downto 48),\c$bv_40\(48-1 downto 0));

  ccase_alt_0 <= ccase_alt.Tup3_sel0_signed_0;

  ccase_alt_1 <= ccase_alt.Tup3_sel1_signed_1;

  ccase_alt_2 <= ccase_alt.Tup3_sel2_signed_2;


end;


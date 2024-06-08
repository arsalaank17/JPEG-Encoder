library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package Main_topEntity_types is


  type Tup2_1 is record
    Tup2_1_sel0_signed_0 : signed(63 downto 0);
    Tup2_1_sel1_signed_1 : signed(63 downto 0);
  end record;
  type array_of_signed_64 is array (integer range <>) of signed(63 downto 0);
  subtype Maybe is std_logic_vector(128 downto 0);
  type array_of_Maybe is array (integer range <>) of Maybe;
  type Tup2_0 is record
    Tup2_0_sel0_signed : signed(63 downto 0);
    Tup2_0_sel1_array_of_Maybe : array_of_Maybe(0 to 63);
  end record;
  type Tup2 is record
    Tup2_sel0_signed : signed(63 downto 0);
    Tup2_sel1_Maybe : Maybe;
  end record;
  type array_of_array_of_8_signed_64 is array (integer range <>) of array_of_signed_64(0 to 7);
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
  function tagToEnum (s : in signed) return boolean;
  function dataToTag (b : in boolean) return signed;
  function toSLV (s : in signed) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return signed;
  function toSLV (p : Tup2_1) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup2_1;
  function toSLV (value :  array_of_signed_64) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_signed_64;
  function toSLV (slv : in std_logic_vector) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic_vector;
  function toSLV (value :  array_of_Maybe) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_Maybe;
  function toSLV (p : Tup2_0) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup2_0;
  function toSLV (p : Tup2) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup2;
  function toSLV (value :  array_of_array_of_8_signed_64) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_array_of_8_signed_64;
end;

package body Main_topEntity_types is
  function toSLV (b : in boolean) return std_logic_vector is
  begin
    if b then
      return "1";
    else
      return "0";
    end if;
  end;
  function fromSLV (sl : in std_logic_vector) return boolean is
  begin
    if sl = "1" then
      return true;
    else
      return false;
    end if;
  end;
  function tagToEnum (s : in signed) return boolean is
  begin
    if s = to_signed(0,64) then
      return false;
    else
      return true;
    end if;
  end;
  function dataToTag (b : in boolean) return signed is
  begin
    if b then
      return to_signed(1,64);
    else
      return to_signed(0,64);
    end if;
  end;
  function toSLV (s : in signed) return std_logic_vector is
  begin
    return std_logic_vector(s);
  end;
  function fromSLV (slv : in std_logic_vector) return signed is
    alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return signed(islv);
  end;
  function toSLV (p : Tup2_1) return std_logic_vector is
  begin
    return (toSLV(p.Tup2_1_sel0_signed_0) & toSLV(p.Tup2_1_sel1_signed_1));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup2_1 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 63)),fromSLV(islv(64 to 127)));
  end;
  function toSLV (value :  array_of_signed_64) return std_logic_vector is
    alias ivalue    : array_of_signed_64(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 64);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 64) + 1 to i*64) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_signed_64 is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_signed_64(0 to slv'length / 64 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 64 to (i+1) * 64 - 1));
    end loop;
    return result;
  end;
  function toSLV (slv : in std_logic_vector) return std_logic_vector is
  begin
    return slv;
  end;
  function fromSLV (slv : in std_logic_vector) return std_logic_vector is
  begin
    return slv;
  end;
  function toSLV (value :  array_of_Maybe) return std_logic_vector is
    alias ivalue    : array_of_Maybe(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 129);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 129) + 1 to i*129) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_Maybe is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_Maybe(0 to slv'length / 129 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 129 to (i+1) * 129 - 1));
    end loop;
    return result;
  end;
  function toSLV (p : Tup2_0) return std_logic_vector is
  begin
    return (toSLV(p.Tup2_0_sel0_signed) & toSLV(p.Tup2_0_sel1_array_of_Maybe));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup2_0 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 63)),fromSLV(islv(64 to 8319)));
  end;
  function toSLV (p : Tup2) return std_logic_vector is
  begin
    return (toSLV(p.Tup2_sel0_signed) & toSLV(p.Tup2_sel1_Maybe));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup2 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 63)),fromSLV(islv(64 to 192)));
  end;
  function toSLV (value :  array_of_array_of_8_signed_64) return std_logic_vector is
    alias ivalue    : array_of_array_of_8_signed_64(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 512);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 512) + 1 to i*512) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_array_of_8_signed_64 is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_array_of_8_signed_64(0 to slv'length / 512 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 512 to (i+1) * 512 - 1));
    end loop;
    return result;
  end;
end;


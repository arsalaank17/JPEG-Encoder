--------------------------------------------------------------------------------
-- PROJECT: SIMPLE UART FOR FPGA
--------------------------------------------------------------------------------
-- AUTHORS: Jakub Cabal <jakubcabal@gmail.com>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/uart-for-fpga
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- UART LOOPBACK EXAMPLE TOP MODULE FOR CYC1000 BOARD
-- ==================================================
-- UART FOR FPGA REQUIRES: 1 START BIT, 8 DATA BITS, 1 STOP BIT!!!
-- OTHER PARAMETERS CAN BE SET USING GENERICS.

entity UART_LOOPBACK_CYC1000 is
    Generic (
        CLK_FREQ      : integer := 50e6;   -- set system clock frequency in Hz
        BAUD_RATE     : integer := 9600; -- baud rate value
        PARITY_BIT    : string  := "none"; -- legal values: "none", "even", "odd", "mark", "space"
        USE_DEBOUNCER : boolean := True    -- enable/disable debouncer
    );
    Port (
        CLK_50M   : in  std_logic; -- system clock 50 MHz
        RST_BTN_N : in  std_logic; -- low active reset button
        -- UART INTERFACE
        UART_TXD  : out std_logic;
        UART_RXD  : in  std_logic
    );
end entity;

architecture RTL of UART_LOOPBACK_CYC1000 is

    signal rst_btn : std_logic;
    signal reset   : std_logic;
	 
    signal rx_data : std_logic_vector(7 downto 0);
    signal tx_data : std_logic_vector(7 downto 0);
	 
    signal valid   : std_logic;
	 
	 signal in1 : signed(31 downto 0);
	 signal in2 : signed(31 downto 0);
	 signal in3 : signed(31 downto 0);
	 
	 signal out1 : signed(31 downto 0);
	 signal out2 : signed(31 downto 0);
	 signal out3 : signed(31 downto 0);
	 
	 

begin

    rst_btn <= not RST_BTN_N;

    rst_sync_i : entity work.RST_SYNC
    port map (
        CLK        => CLK_50M,
        ASYNC_RST  => rst_btn,
        SYNCED_RST => reset
    );

	uart_i: entity work.UART
    generic map (
        CLK_FREQ      => CLK_FREQ,
        BAUD_RATE     => BAUD_RATE,
        PARITY_BIT    => PARITY_BIT,
        USE_DEBOUNCER => USE_DEBOUNCER
    )
    port map (
        CLK          => CLK_50M,
        RST          => reset,
        -- UART INTERFACE
        UART_TXD     => UART_TXD,
        UART_RXD     => UART_RXD,
        -- USER DATA INPUT INTERFACE
        DIN          => tx_data,
        DIN_VLD      => valid,
        DIN_RDY      => open,
        -- USER DATA OUTPUT INTERFACE
        DOUT         => rx_data,
        DOUT_VLD     => valid,
        FRAME_ERROR  => open,
        PARITY_ERROR => open
    );
	 
	ycbcr: entity work.RGBTOYCBCR
	port map (
			clk 			=> CLK_50M,
			rst         => reset,  
			i_0         => "00000000011110000000000000000000", -- 120
			i_1     		=> "00000000001100100000000000000000", -- 50
			i_2         => "00000000000101000000000000000000", -- 20
			ccase_alt_0 => out1,
			ccase_alt_1 => out2,
			ccase_alt_2 => out3
	 );

process(rx_data)
	 begin
			case rx_data is
			when "00000001" => tx_data <= std_logic_vector(out1(31 downto 24));
			when "00000010" => tx_data <= std_logic_vector(out1(23 downto 16));
			when "00000011" => tx_data <= std_logic_vector(out1(15 downto 8));
			when "00000100" => tx_data <= std_logic_vector(out1(7 downto 0));
			when others		 => tx_data <= "10101010";
			end case;
	 end process;
	
	 
	
	 

end architecture;
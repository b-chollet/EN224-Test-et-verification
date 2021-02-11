----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2021 18:35:10
-- Design Name: 
-- Module Name: test_bench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_bench is
--  Port ( );
end test_bench;

architecture tb of test_bench is

    component pgcd
        port (CLK      : in std_logic;
              RESET    : in std_logic;
              idata_a  : in std_logic_vector (31 downto 0);
              idata_b  : in std_logic_vector (31 downto 0);
              idata_en : in std_logic;
              odata    : out std_logic_vector (31 downto 0);
              odata_en : out std_logic);
    end component;

    signal CLK      : std_logic;
    signal RESET    : std_logic;
    signal idata_a  : std_logic_vector (31 downto 0);
    signal idata_b  : std_logic_vector (31 downto 0);
    signal idata_en : std_logic;
    signal odata    : std_logic_vector (31 downto 0);
    signal odata_en : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : pgcd
    port map (CLK      => CLK,
              RESET    => RESET,
              idata_a  => idata_a,
              idata_b  => idata_b,
              idata_en => idata_en,
              odata    => odata,
              odata_en => odata_en);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK is really your main clock signal
    CLK <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        idata_a <= (others => '0');
        idata_b <= (others => '0');
        idata_en <= '0';

        -- Reset generation
        -- EDIT: Check that RESET is really your reset signal
        RESET <= '1';
        wait for 100 ns;
        RESET <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 10 * TbPeriod;
		idata_a <= std_logic_vector(to_unsigned(12, 32));
        idata_b <= std_logic_vector(to_unsigned(0, 32));
        wait for 1 * TbPeriod;
        idata_en <= '1';
        wait for 1 * TbPeriod;
        idata_en <= '0';
        wait for 10 * TbPeriod;
        
        wait for 10 * TbPeriod;
		idata_a <= std_logic_vector(to_unsigned(150, 32));
        idata_b <= std_logic_vector(to_unsigned(25, 32));
        wait for 1 * TbPeriod;
        idata_en <= '1';
        wait for 1 * TbPeriod;
        idata_en <= '0';
        wait for 50 * TbPeriod;
        
        wait for 10 * TbPeriod;
		idata_a <= std_logic_vector(to_unsigned(896, 32));
        idata_b <= std_logic_vector(to_unsigned(1046, 32));
        wait for 1 * TbPeriod;
        idata_en <= '1';
        wait for 1 * TbPeriod;
        idata_en <= '0';
        wait for 50 * TbPeriod;
        
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

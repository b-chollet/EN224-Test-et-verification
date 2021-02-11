----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2021 13:40:55
-- Design Name: 
-- Module Name: pgcd - Behavioral
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

entity pgcd is
port(
		CLK      : in  STD_LOGIC;
		RESET    : in  STD_LOGIC;
	
		idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
		idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
		idata_en : in  STD_LOGIC;
	
		odata    : out STD_LOGIC_VECTOR (31 downto 0);
		odata_en : out STD_LOGIC
);
end pgcd;

architecture Behavioral of pgcd is
	type Etat is ( Etat_init, Etat_Check, Etat_Az, Etat_CalStart, Etat_CalEnd );
	signal pr_state , nx_state : Etat := Etat_init;
	signal value_A, value_B : integer;
begin

	maj_etat : process ( CLK , RESET )
    begin
        if (RESET ='1') then
            pr_state <= Etat_init ;
        elsif ( CLK ' event and CLK ='1') then
            	pr_state <= nx_state ;
        end if;
    end process maj_etat;

	cal_nx_state : process (pr_state, idata_en, value_A, value_B)
    begin
    	case pr_state is
    		when Etat_init =>
    			if(idata_en = '1') then
    				nx_state <= Etat_Check;
    			else
    				nx_state <= Etat_init;
    			end if;
    		when Etat_Check =>
    			if(idata_a = idata_b) then
    				nx_state <= Etat_CalEnd;
    			elsif(idata_a = "00000000000000000000000000000000") then
    				nx_state <= Etat_Az;
    			elsif(idata_b = "00000000000000000000000000000000") then
    				nx_state <= Etat_CalEnd;
    			elsif ((idata_a /= "00000000000000000000000000000000") and (idata_b /= "00000000000000000000000000000000")) then
    				nx_state <= Etat_CalStart;
    			else
    				nx_state <= Etat_Check;
    			end if;
    			
    		when Etat_Az =>
    			nx_state <= Etat_init;
    		
    		when Etat_CalStart =>
    			if(value_A = value_B) then
    				nx_state <= Etat_CalEnd;
    			else
    				nx_state <= Etat_CalStart;
    			end if;
    			
    		when Etat_CalEnd =>
    			nx_state <= Etat_init;
    		
    		when others =>
    			nx_state <= Etat_init;
    	end case;
    end process cal_nx_state;
    
    cal_output : process( pr_state )
    begin
    	case pr_state is
    		when Etat_Init =>
    			odata_en <= '0';  			
    		when Etat_Az =>
    			odata <= std_logic_vector(to_unsigned(value_B, 32));
    			odata_en <= '1';
    		when Etat_CalEnd =>
    			odata <= std_logic_vector(to_unsigned(value_A, 32));
    			odata_en <= '1';
    		when others =>
    			odata <= std_logic_vector(to_unsigned(0, 32));
    			odata_en <= '0';
    	end case;
    end process cal_output;
    
    calcule : process( CLK )
    begin
    	if (CLK ' event and CLK ='1') then
    		if (pr_state = Etat_CalStart)then
				if (value_A > value_B) then
					value_A <= value_A - value_B;
				elsif (value_A < value_B) then
					value_B <= value_B - value_A;		
				end if;
			elsif (pr_state = Etat_Check) then
				value_A <= to_integer(unsigned(idata_a));
    			value_B <= to_integer(unsigned(idata_b));
			else
				value_A <= value_A;
				value_B <= value_B;
			end if;
    	end if;
    end process calcule;
end Behavioral;

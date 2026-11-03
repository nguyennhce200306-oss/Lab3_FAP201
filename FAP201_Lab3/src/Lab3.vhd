-- Git account : Nguyen Hoang Nguyen
-- Author      : Nguyen Hoang Nguyen
-- Student ID  : CE200306
-- Purpose     : Lab03 - LED doi trang thai 1 lan moi khi NHA switch (release event)

library ieee;
use ieee.std_logic_1164.all;

entity Lab3 is
  port (
    i_Clk    : in  std_logic;  
    i_Switch : in  std_logic;  
    o_LED    : out std_logic   
  );
end entity Lab3;

architecture RTL of Lab3 is
  signal curr_pressed  : std_logic := '0';  
  signal prev_pressed  : std_logic := '0';  
  signal release_event : std_logic;         
  signal r_LED         : std_logic := '0';  
begin
  process (i_Clk) is
  begin
    if rising_edge(i_Clk) then
      curr_pressed <= not i_Switch;
      prev_pressed <= curr_pressed;
    end if;
  end process;

 
  release_event <= prev_pressed and (not curr_pressed);

  process (i_Clk) is
  begin
    if rising_edge(i_Clk) then
      if release_event = '1' then
        r_LED <= not r_LED;
      end if;
    end if;
  end process;

  o_LED <= r_LED;
end architecture RTL;

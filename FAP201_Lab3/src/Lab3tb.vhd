-- Git account : Nguyen Hoang Nguyen
-- Author      : Nguyen Hoang Nguyen
-- Student ID  : CE200306
-- Purpose     : Testbench Lab03 - kiem tra toggle khi nha, giu trang thai, 2 chu ky

library ieee;
use ieee.std_logic_1164.all;

entity Lab3_tb is
end entity Lab3_tb;

architecture sim of Lab3_tb is
  signal i_Clk    : std_logic := '0';
  signal i_Switch : std_logic := '1';  
  signal o_LED    : std_logic;
  signal done     : std_logic := '0';
begin
  uut : entity work.Lab3
    port map (i_Clk => i_Clk, i_Switch => i_Switch, o_LED => o_LED);

  clk_proc : process is
  begin
    while done = '0' loop
      i_Clk <= '0'; wait for 10 ns;
      i_Clk <= '1'; wait for 10 ns;
    end loop;
    wait;
  end process;

  stim_proc : process is
  begin
    
    i_Switch <= '1'; wait for 200 ns;
    assert o_LED = '0' report "FAIL T1: idle" severity error;

    
    i_Switch <= '0'; wait for 200 ns;
    assert o_LED = '0' report "FAIL T2: press/hold" severity error;

    
    i_Switch <= '1'; wait for 200 ns;
    assert o_LED = '1' report "FAIL T3: release 1" severity error;

    
    wait for 200 ns;
    assert o_LED = '1' report "FAIL T4: idle after release" severity error;

    
    i_Switch <= '0'; wait for 200 ns;
    assert o_LED = '1' report "FAIL T5a: press 2" severity error;
    i_Switch <= '1'; wait for 200 ns;
    assert o_LED = '0' report "FAIL T5b: release 2" severity error;

    report "LAB03 ALL TESTS PASS" severity note;
    done <= '1';
    wait;
  end process;
end architecture sim;

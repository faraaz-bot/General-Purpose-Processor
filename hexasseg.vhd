LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hexasseg IS
    PORT (
        bcd      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        neg      : IN  STD_LOGIC;
        leds     : OUT STD_LOGIC_VECTOR(1 TO 7);
        negative : OUT STD_LOGIC_VECTOR(1 TO 7)
    );
END hexasseg;

ARCHITECTURE behavior OF hexasseg IS
BEGIN
    PROCESS (bcd, neg)
    BEGIN
        CASE bcd IS  -- abcdefg
            WHEN "0000" => leds <= "0000001";  -- 0
            WHEN "0001" => leds <= "1001111";  -- 1
            WHEN "0010" => leds <= "0010010";  -- 2
            WHEN "0011" => leds <= "0000110";  -- 3
            WHEN "0100" => leds <= "1001100";  -- 4
            WHEN "0101" => leds <= "0100100";  -- 5
            WHEN "0110" => leds <= "0100000";  -- 6
            WHEN "0111" => leds <= "0001111";  -- 7
            WHEN "1000" => leds <= "0000000";  -- 8
            WHEN "1001" => leds <= "0000100";  -- 9
            WHEN "1010" => leds <= "0001000";  -- A (10)
            WHEN "1011" => leds <= "1100000";  -- b (11)
            WHEN "1100" => leds <= "0110001";  -- C (12)
            WHEN "1101" => leds <= "1000010";  -- d (13)
            WHEN "1110" => leds <= "0110000";  -- E (14)
            WHEN "1111" => leds <= "0111000";  -- F (15)
            WHEN OTHERS => leds <= "0110000";  -- Error (display E)
        END CASE;

        IF neg = '0' THEN  -- If the number is not negative
            negative <= "1111111";  -- No negative sign
        ELSE  -- If the number is negative
            negative <= "1111110";  -- Display negative sign on the 7-segment
        END IF;
    END PROCESS;
END behavior;

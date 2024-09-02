LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY latch IS
PORT (
    A      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    Resetn : IN STD_LOGIC;
    Clock  : IN STD_LOGIC;
    Q      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END latch;

ARCHITECTURE behavior OF latch IS
BEGIN
    PROCESS(Resetn, Clock)
    BEGIN
        IF Resetn = '0' THEN
            Q <= "00000000";
        ELSIF Clock'EVENT AND Clock = '1' THEN
            Q <= A;
        END IF;
    END PROCESS;
END behavior;

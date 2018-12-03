library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY shiftreg IS
    PORT(
          SO : OUT STD_LOGIC;
          SI : IN STD_LOGIC;
          Clock : IN STD_LOGIC);
END ENTITY shiftreg;

ARCHITECTURE Behavioural OF shiftreg IS
SIGNAL Q : STD_LOGIC_VECTOR(3 downto 0);
BEGIN

PROCESS(Clock)
BEGIN
IF(CLK'EVENT AND CLK = '1') THEN
  Q(3 downto 0) <= Q(2 downto 0) & SI;
END IF;
END PROCESS;

-- concurrent assigssnment statement
SO <= Q(3);

END ARCHITECTURE Behavioural;

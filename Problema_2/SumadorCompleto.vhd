
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Se define la entidad FullAdder
entity FullAdder is
    Port ( 
        A    : in  STD_LOGIC;  -- Bit de entrada A
        B    : in  STD_LOGIC;  -- Bit de entrada B
        Cin  : in  STD_LOGIC;  -- Bit de acarreo de entrada
        Sum  : out STD_LOGIC;  -- Bit de suma de salida
        Cout : out STD_LOGIC   -- Bit de acarreo de salida
    );
end FullAdder;

architecture Behavioral of FullAdder is
begin
    -- Cálculo de la suma usando la operación XOR
    Sum  <= A XOR B XOR Cin;
    
    -- Cálculo del acarreo de salida usando la lógica combinacional
    Cout <= (A AND B) OR (Cin AND (A XOR B));

end Behavioral;

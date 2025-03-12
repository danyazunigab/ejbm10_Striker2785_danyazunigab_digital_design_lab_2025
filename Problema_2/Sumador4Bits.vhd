library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Definición de la entidad FourBitAdder
-- Este módulo implementa un sumador de 4 bits utilizando instancias de sumadores completos (FullAdder).
entity FourBitAdder is
    Port ( 
        A    : in  STD_LOGIC_VECTOR (3 downto 0);  
        B    : in  STD_LOGIC_VECTOR (3 downto 0);  
        Cin  : in  STD_LOGIC;                      
        Sum  : out STD_LOGIC_VECTOR (3 downto 0);  
        Cout : out STD_LOGIC                       
    );
end FourBitAdder;

architecture Structural of FourBitAdder is
    component FullAdder
        Port ( 
            A    : in  STD_LOGIC;  
            B    : in  STD_LOGIC;  
            Cin  : in  STD_LOGIC;  
            Sum  : out STD_LOGIC;  
            Cout : out STD_LOGIC   
        );
    end component;

    -- Señal interna para conectar los acarreo entre los sumadores
    signal C : STD_LOGIC_VECTOR (3 downto 0); 

begin
    -- Instanciación de cuatro sumadores completos en cascada para formar el sumador de 4 bits

    -- Primer sumador (bit menos significativo)
    FA0: FullAdder port map(A(0), B(0), Cin, Sum(0), C(0));

    -- Segundo sumador (propaga el acarreo del primer sumador)
    FA1: FullAdder port map(A(1), B(1), C(0), Sum(1), C(1));

    -- Tercer sumador (propaga el acarreo del segundo sumador)
    FA2: FullAdder port map(A(2), B(2), C(1), Sum(2), C(2));

    -- Cuarto sumador (bit más significativo, el acarreo de salida es Cout)
    FA3: FullAdder port map(A(3), B(3), C(2), Sum(3), Cout);

end Structural;

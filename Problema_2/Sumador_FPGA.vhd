-- Importación de la biblioteca IEEE estándar para lógica digital
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Definición de la entidad FourBitAdder_FPGA
-- Este módulo representa un sumador de 4 bits diseñado para una FPGA,
-- con entradas desde interruptores (SW) y salida en un display de 7 segmentos (HEX).
entity FourBitAdder_FPGA is
    Port ( 
        SW   : in  STD_LOGIC_VECTOR (7 downto 0);  
        Cin  : in  STD_LOGIC;                      
        HEX  : out STD_LOGIC_VECTOR (6 downto 0);  
        Cout : out STD_LOGIC                       
    ); 
end FourBitAdder_FPGA;

-- Definición de la arquitectura
architecture Behavioral of FourBitAdder_FPGA is
    
    component FourBitAdder
        Port ( 
            A    : in  STD_LOGIC_VECTOR (3 downto 0);  -- Entrada A (4 bits)
            B    : in  STD_LOGIC_VECTOR (3 downto 0);  -- Entrada B (4 bits)
            Cin  : in  STD_LOGIC;                      -- Acarreo de entrada
            Sum  : out STD_LOGIC_VECTOR (3 downto 0);  -- Salida de la suma (4 bits)
            Cout : out STD_LOGIC                       -- Acarreo de salida
        );
    end component;

    
    signal A, B, Sum : STD_LOGIC_VECTOR (3 downto 0);
    
begin
   
    A <= SW(7 downto 4);  
    B <= SW(3 downto 0);  

    -- Instanciación del componente FourBitAdder y conexión de sus señales
    SUMADOR: FourBitAdder port map(A, B, Cin, Sum, Cout);

    -- Conversión del resultado a código de 7 segmentos para su visualización
    process(Sum)
    begin
        case Sum is
            when "0000" => HEX <= "1000000"; 
            when "0001" => HEX <= "1111001"; 
            when "0010" => HEX <= "0100100"; 
            when "0011" => HEX <= "0110000"; 
            when "0100" => HEX <= "0011001"; 
            when "0101" => HEX <= "0010010"; 
            when "0110" => HEX <= "0000010"; 
            when "0111" => HEX <= "1111000"; 
            when "1000" => HEX <= "0000000"; 
            when "1001" => HEX <= "0010000"; 
            when "1010" => HEX <= "0001000"; 
            when "1011" => HEX <= "0000011"; 
            when "1100" => HEX <= "1000110"; 
            when "1101" => HEX <= "0100001"; 
            when "1110" => HEX <= "0000110"; 
            when "1111" => HEX <= "0001110"; 
            when others => HEX <= "1111111"; 
        end case;
    end process;
end Behavioral;

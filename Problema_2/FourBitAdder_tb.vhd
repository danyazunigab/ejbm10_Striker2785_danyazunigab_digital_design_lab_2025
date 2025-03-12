LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY FourBitAdder_tb IS
END ENTITY;

ARCHITECTURE test OF FourBitAdder_tb IS
    -- Señales para conectar con el sumador
    SIGNAL A, B : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Cin  : STD_LOGIC;
    SIGNAL Sum  : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Cout : STD_LOGIC;
    
    -- Instancia del sumador
    COMPONENT FourBitAdder
        PORT (
            A, B  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            Cin   : IN STD_LOGIC;
            Sum   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Cout  : OUT STD_LOGIC
        );
    END COMPONENT;
    
BEGIN
    -- Conexión de la instancia
    UUT: FourBitAdder PORT MAP (A, B, Cin, Sum, Cout);

    -- Proceso de pruebas
    PROCESS
    BEGIN
        -- Caso 1: 0000 + 0000 con Carry In = 0
        A  <= "0000"; B <= "0000"; Cin <= '0';
        WAIT FOR 10 ns;
        
        -- Caso 2: 0001 + 0010 con Carry In = 0
        A  <= "0001"; B <= "0010"; Cin <= '0';
        WAIT FOR 10 ns;

        -- Caso 3: 0110 + 0011 con Carry In = 1
        A  <= "0110"; B <= "0011"; Cin <= '1';
        WAIT FOR 10 ns;

        -- Caso 4: 1111 + 0001 con Carry In = 0 (prueba de desbordamiento)
        A  <= "1111"; B <= "0001"; Cin <= '0';
        WAIT FOR 10 ns;

        -- Fin de la simulación
        WAIT;
    END PROCESS;
END ARCHITECTURE;

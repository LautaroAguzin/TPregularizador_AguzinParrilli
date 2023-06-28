entity tpr5_tb is
end;

architecture behavioual of tpr5_tb is

component tpr5 is
    port(
        enable: in bit;
        reset: in bit;
        clock: in bit;
	e: in bit;
        estado: out bit_vector(1 downto 0);
        salida: out bit);
end component;

signal enatb, rsttb, clktb, etb: bit:='0';
signal estb: bit_vector(1 downto 0);
signal salidatb: bit;

begin 
dut: tpr5 port map(enable=>enatb,reset=>rsttb,clock=>clktb, e=>etb,estado=>estb, salida=>salidatb);

clktb<= not clktb after 100 ns;
enatb<='1';
rsttb<='0';
etb<= '1', '0' after 500 ns;

end;

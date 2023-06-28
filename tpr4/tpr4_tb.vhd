entity tpr4_tb is
end;

architecture behavioural of tpr4_tb is

	component tpr4 is
	port(
	clkb: in bit;
	rstb: in bit;
	enab: in bit;
	qob: out bit_vector(3 downto 0));
	end component;

signal clk,rst,ena: bit;

signal qo: bit_vector (3 downto 0);

begin 

clk <= not clk after 50 ns;
rst <= '0';
ena <= '1';

dut: tpr4 port map(clkb=> clk, rstb=> rst, enab=> ena, qob=>qo);

end;

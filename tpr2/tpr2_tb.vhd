entity tpr2_tb is
end;

architecture behavioural of tpr2_tb is
    component tpr2 is
        port(
            a: in bit;
            b: in bit;
            c: in bit;
            d: in bit;
            s: out bit);
     end component;

     signal atb,btb,ctb,dtb,stb: bit;

    begin
        atb <= not atb after 20 ns;
        btb <= not btb after 40 ns;
        ctb <= not ctb after 80 ns;
        dtb <= not dtb after 160 ns;

        dut: tpr2 port map(a=> atb, b=> btb, c=> ctb, d=> dtb, s=>stb);
end;
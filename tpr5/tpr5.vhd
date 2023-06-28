entity tpr5 is
    port(
        enable: in bit;
        reset: in bit;
        clock: in bit;
	e: in bit;
        estado: out bit_vector(1 downto 0);
        salida: out bit);
end;

architecture test of tpr5 is

    signal qa, qb: bit;
    signal qa1, qb1: bit;

    component ffd
    port (
		clki: in bit;
		rsti: in bit;
		enai: in bit;
		di: in bit;
		qo: out bit);
    end component;

begin
    ffda: ffd port map(clki=>clock,rsti=>reset,enai=>enable,di=>qa1,qo=>qa);
    	qa1<=(qa and (not qb)) or ((not qa) and qb and e);
 
    ffdb: ffd port map(clki=>clock,rsti=>reset,enai=>enable,di=>qb1,qo=>qb);
   	qb1<=((not qa) and (not qb) and e) or (qa and qb and e) or (qa and (not qb) and (not e));
    

    estado(1) <= qa;
    estado(0)<= qb;
    salida <= qa and qb;
end;

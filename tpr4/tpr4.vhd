entity tpr4 is
port(
	clkb: in bit;
	rstb: in bit;
	enab: in bit;
	qob: out bit_vector(3 downto 0));
end;
architecture test of tpr4 is

signal ds,qos: bit_vector(3 downto 0);
--------------------------------------
	component ffd
		port (
			clki: in bit;
			rsti: in bit;
			enai: in bit;
			di: in bit;
			qo: out bit);
	end component;
--------------------------------------


begin
ffd3: ffd port map(clki=>clkb,rsti=>rstb,enai=>enab,di=>ds(3),qo=>qos(3));
	ds(3) <= ((not qos(3)) and qos(2)) or (qos(3) and (not qos(2)));

ffd2: ffd port map(clki=>clkb,rsti=>rstb,enai=>enab,di=>ds(2),qo=>qos(2));
	ds(2)<= not qos(2);

ffd1: ffd port map(clki=>clkb,rsti=>rstb,enai=>enab,di=>ds(1),qo=>qos(1));
	ds(1)<= '0';

ffd0: ffd port map(clki=>clkb, rsti=>rstb,enai=>enab,di=>ds(0),qo=>qos(0));
	ds(0) <= '0';

qob <= qos;

end;
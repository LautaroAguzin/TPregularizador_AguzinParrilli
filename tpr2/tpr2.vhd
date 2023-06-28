entity tpr2 is
	port(
	a: in bit;
	b: in bit;
	c: in bit;
	d: in bit;
	s: out bit);
end;

architecture test of tpr2 is

begin

s<= ((not a) and (not b)) or ((not b) and (not d)) or ((not a) and (not c) and d);

end;
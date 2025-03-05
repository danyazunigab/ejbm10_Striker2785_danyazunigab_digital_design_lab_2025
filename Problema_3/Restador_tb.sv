module Restador_tb();

logic a, b, z;

Restador m1(a,b,z);

initial begin

a = 0;
b = 0;
#40
a = 0;
b = 1;
#40
a = 1;
b = 0;
#40
a = 1;
b = 1;

end
endmodule
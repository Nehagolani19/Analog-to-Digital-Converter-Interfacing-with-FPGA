// a,b,c - select line
// ale_in and ale_out - Address Latch Enable
// sc_in and sc_out - start conversion
// clk_in and clk_out - clock_in (internal clock-50 MHz), clock_out(divided clock-0.5 kHz)
// oe - output enable
// eoc - end of conversion
// in_data - output of ADC IC is used as input for FPGA
// out_data - 8-bit digital output data

module ADC(a, b, c, ale_in, ale_out, sc_in, sc_out, clk_in, clk_out, oe, eoc, in_data, out_data);
    input clk_in, ale_in, sc_in;
    output reg sc_out, ale_out;
    output clk_out;
    input [7:0] in_data;
    output reg a, b, c, oe;
    input eoc;
    output reg [7:0] out_data;
    reg count = 4'b0010;
    output reg led;
//clock divider
reg [16:0] out = 0;
reg divide;
reg [31:0] td = 50000;
reg [31:0] ctr = 0;
always @(posedge clk_in)
begin
    ctr = ctr + 1;
    if (ctr == td)
    begin
        ctr = 0;
        if (divide == 1)
            divide = 0;
        else
            divide = 1;
    end
end
// assign our actual clock is divided clock
assign clk_out = divide;

always @ (posedge divide)
begin

    // for transition
    ale_out = divide & ale_in;
    sc_out  = divide & sc_in;
// for transition
ale_out = divide & ale_in;
sc_out  = divide & sc_in;

// check end of conversion
if (eoc == 0)
    count = count - 1;   // make a counter for delay time when eoc = 0

if (count == 0)
begin
    oe = 1'b1;
    out_data = in_data;
end
else
    oe = 1'b0;
end
endmodule

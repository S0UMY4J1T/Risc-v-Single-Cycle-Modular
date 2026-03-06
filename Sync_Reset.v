module Sync_Reset #(
    parameter DATA_BUS_WIDTH    = 32
) (
    input                             clk, reset,
    input      [DATA_BUS_WIDTH-1 : 0] data,
    output reg [DATA_BUS_WIDTH-1 : 0] out
);

    always @(posedge clk ) begin
        if (reset) out <= 0;
        else out <= data; 
    end
    
endmodule
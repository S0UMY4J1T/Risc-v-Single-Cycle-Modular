module Register_File #(
    parameter ADDRESS_BUS_WIDTH = 5,
    parameter DATA_BUS_WIDTH    = 32,
    parameter XLEN              = 32
) (
    input                            clk, WE3,
    input  [ADDRESS_BUS_WIDTH-1 : 0] A1, A2, A3,
    input  [DATA_BUS_WIDTH-1 : 0]    WD3,
    output [DATA_BUS_WIDTH-1 : 0]    RD1 , RD2 
);
    reg [XLEN-1 : 0] register_file [DATA_BUS_WIDTH-1 : 0] ;

    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            register_file[i] = 0;
        end
    end

    assign RD1 = register_file[A1] ;
    assign RD2 = register_file[A2] ;

    always @(posedge clk ) begin
        register_file[A3] <= (WE3)? WD3 : register_file[A3] ;
    end
    
endmodule
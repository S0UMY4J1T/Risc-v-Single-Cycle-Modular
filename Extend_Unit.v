module Extend_Unit #(
    parameter DATA_BUS_WIDTH = 32
) ( 
    input      [DATA_BUS_WIDTH-1 : 0] Instr,
    input      [2:0]                  ImmSrc,
    output reg [DATA_BUS_WIDTH-1 : 0] ImmExt
);
    always @(*) begin
        casex (ImmSrc)
            3'b000: ImmExt = { {20{Instr[31]}} , Instr[31:20]};
            3'b001: ImmExt = { {20{Instr[31]}} , Instr[31:25] , Instr[11:7] };
            3'b010: ImmExt = { {19{Instr[31]}} , Instr[31], Instr[7], Instr[30:25], Instr[11:8], 1'b0};
            3'b011: ImmExt = { {11{Instr[31]}} , Instr[31], Instr[19:12], Instr[20], Instr[30:21], 1'b0}; 
            3'b100: ImmExt = { Instr[31:12] , 12'b0 };
            default: ImmExt = 32'bx;
        endcase 
    end
    
endmodule
module RiscV_CPU #(
    parameter ADDRESS_BUS_WIDTH = 5,
    parameter DATA_BUS_WIDTH    = 32
) (
    input                         clk, reset,
    input  [DATA_BUS_WIDTH-1 : 0] Instr, RD_DataMem,
    output                        WE ,
    output [DATA_BUS_WIDTH-1 : 0] PC , Result, ALUResult, WD_DataMem
);

    wire [2:0] ALUControl, ImmSrc ;
    wire [1:0] ResultSrc ;
    wire RegWrite, Condition, ALUSrcA, ALUSrcB, JALR, PCSrc ;

    Control_Path name1 (Condition, Instr[30], Instr[14:12], Instr[6:0], RegWrite, WE, ALUSrcA, ALUSrcB, JALR, PCSrc, ResultSrc, ImmSrc, ALUControl);
    Data_Path name2 (clk, reset, RegWrite, ALUSrcA, ALUSrcB, JALR, PCSrc, ResultSrc, ImmSrc, ALUControl, Instr, RD_DataMem, Condition, PC, Result, ALUResult, WD_DataMem);

    
endmodule

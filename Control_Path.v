module Control_Path ( 
    input                          Condition,
    input                          funct7b5,
    input  [2:0]                   funct3,
    input  [6:0]                   opcode,
    output                         RegWrite, MemWrite, ALUSrcA, ALUSrcB, JALR, PCSrc,
    output [1:0]                   ResultSrc, 
    output [2:0]                   ImmSrc, ALUControl
);

wire [1:0] ALUOp;

Main_Controller name1 (Condition, opcode, RegWrite, MemWrite, ALUSrcA, ALUSrcB, JALR, PCSrc, ResultSrc, ALUOp, ImmSrc);
ALU_Controller name2  (funct7b5, ALUOp, funct3, ALUControl);

endmodule
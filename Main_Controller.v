module Main_Controller (
    input                          Condition,
    input  [6:0]                   opcode,
    output                         RegWrite, MemWrite, ALUSrcA, ALUSrcB, JALR, PCSrc,
    output [1:0]                   ResultSrc, ALUOp,
    output [2:0]                   ImmSrc
); 


    /* ===========================================================

     Instruction | RegWrite | MemWrite | ALUSrc | ResultSrc | Branch | ImmSrc
     ----------------------------------------------------------------------
     R-type      |    1     |    0     |   0    |     0     |   0   |  XX
     I-type      |    1     |    0     |   1    |     0     |   0   |  00
     Load (lw)   |    1     |    0     |   1    |     1     |   0   |  00
     Store (sw)  |    0     |    1     |   1    |     X     |   0   |  01
     Branch(beq) |    0     |    0     |   0    |     X     |   1*  |  10 

     *PCSrc for branch is conditional:
     PCSrc = Branch & Zero
    ============================================================ */

    reg [13:0] control ;
    wire Branch, Jump; 

    assign {Branch, Jump, RegWrite, MemWrite, ALUSrcA, ALUSrcB, JALR, ResultSrc, ImmSrc, ALUOp} = control ;
    assign PCSrc = (Branch & Condition) | Jump ; 

    always @(*) begin
        casex (opcode)    
            7'b0000011: control = 14'b_0_0_1_0_0_1_0_01_000_00 ; // lw
            7'b0100011: control = 14'b_0_0_0_1_0_1_0_xx_001_00 ; // sw
            7'b0110011: control = 14'b_0_0_1_0_0_0_0_00_0xx_10 ; // R
            7'b1100011: control = 14'b_1_0_0_0_0_0_0_xx_010_xx ; // Br
            7'b0010011: control = 14'b_0_0_1_0_0_1_0_00_000_11 ; // I  
            7'b1101111: control = 14'b_0_1_1_0_0_0_0_10_011_xx ; // JAL
            7'b1100111: control = 14'b_0_1_1_0_0_1_1_10_000_xx ; // JALR
            7'b0110111: control = 14'b_0_0_1_0_0_1_0_00_100_xx ; // LUI 
            7'b0010111: control = 14'b_0_0_1_0_1_1_0_00_100_00 ; // AUIPC
            default: control = 14'b_x_x_x_x_x_x_x_xx_xxx_xx ;
        endcase
    end
    
endmodule
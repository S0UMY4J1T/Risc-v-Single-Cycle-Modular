module ALU #(
    parameter DATA_BUS_WIDTH = 32,

    parameter ADD = 3'b000,
    parameter SUB = 3'b001,
    parameter AND = 3'b010,
    parameter OR  = 3'b011,
    parameter XOR = 3'b100,
    parameter SLT = 3'b101,
    parameter SLL = 3'b110,
    parameter SR  = 3'b111
) (
    input      [DATA_BUS_WIDTH-1 : 0] SrcA, SrcB,
    input      [2 : 0]                funct3,
    input                             funct7b5,
    input      [2 : 0]                ALUControl,
    output     reg                    Condition,
    output reg [DATA_BUS_WIDTH-1 : 0] ALUResult
);

    always @(*) begin
        casex (funct3)
            3'b000: Condition =  (SrcA == SrcB);
            3'b001: Condition = !(SrcA == SrcB);
            3'b100: begin
                if (SrcA[31] == SrcB[31]) Condition = (SrcA < SrcB);
                else Condition = SrcA[31];
            end
            3'b101: begin
                if (SrcA[31] == SrcB[31]) Condition = !(SrcA < SrcB);
                else Condition = !SrcA[31];
            end
            3'b110: Condition =  (SrcA < SrcB) ;
            3'b111: Condition = !(SrcA < SrcB) ;
            default: Condition = 1'bx;
        endcase
    end


    always @(*) begin
        case (ALUControl)
            ADD : ALUResult = SrcA + SrcB  ; 
            SUB : ALUResult = SrcA + ~SrcB + 1 ;
            AND : ALUResult = SrcA & SrcB ;
            OR  : ALUResult = SrcA | SrcB ;
            XOR : ALUResult = SrcA ^ SrcB ;
            SLL : ALUResult = SrcA << SrcB[4:0] ;
            SLT : begin
                if (funct3[0]) ALUResult = (SrcA < SrcB);                     //SLTU
                else begin                                                   //SLT
                    if (SrcA[31] == SrcB[31]) ALUResult = (SrcA < SrcB);
                    else ALUResult = SrcA[31];
                end 
            end
            SR  : begin   
                if (funct7b5) ALUResult =  $signed(SrcA) >>> SrcB[4:0] ;       //SRA
                else ALUResult = SrcA >> SrcB[4:0] ;                    //SRL
            end
        endcase
    end
    
endmodule
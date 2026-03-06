module Data_Path #(
    parameter ADDRESS_BUS_WIDTH = 5,
    parameter DATA_BUS_WIDTH    = 32
) (
    input                         clk, reset, WE3, ALUSrcA, ALUSrcB, JALR, PCSrc,
    input  [1:0]                  ResultSrc,
    input  [2:0]                  ImmSrc, ALUControl,
    input  [DATA_BUS_WIDTH-1 : 0] Instr, RD_DataMem,
    output                        Condition,
    output [DATA_BUS_WIDTH-1 : 0] PC, Result, ALUResult, WD_DataMem
);

    wire  [ADDRESS_BUS_WIDTH-1 : 0] A1, A2, A3;
    wire  [DATA_BUS_WIDTH-1 : 0]    PCNext, PCPlus4, PCPlusImm, PCTarget, WD3, RD1, RD2, ImmExt, SrcA, SrcB;
    wire ReadData ;


    //PC Logic
    Adder name1 (PC, 4, PCPlus4);
    Adder name3 (PC, ImmExt, PCPlusImm);
    Mux2 name11 (JALR, PCPlusImm, ALUResult, PCTarget);
    Mux2 name2 (PCSrc, PCPlus4, PCTarget, PCNext);
    Sync_Reset name4 (clk, reset, PCNext, PC);


    //Register Logic
    Register_File name5 (clk, WE3, A1, A2, A3, WD3, RD1, RD2);
    assign A1     = Instr[19:15] ; 
    assign A2     = Instr[24:20] ;
    assign A3     = Instr[11:07] ;
    Mux4 name6 (ResultSrc, ALUResult, RD_DataMem, PCPlus4, ImmExt, Result);
    assign WD3  = Result;

    //Extend Logic
    Extend_Unit name7 (Instr, ImmSrc, ImmExt);

    //ALU Logic
    ALU name8 (SrcA, SrcB, Instr[14:12], Instr[30], ALUControl, Condition, ALUResult);
    Mux2 name9 (ALUSrcB, RD2, ImmExt, SrcB);
    Mux2 name10 (ALUSrcA, RD1, PC, SrcA);

    //DataMem write Logic
    assign WD_DataMem = RD2;  
    // assign Mem_WrAddr = ALUResult;
    
endmodule

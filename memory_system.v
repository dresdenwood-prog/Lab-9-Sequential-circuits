module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg [7:0] memory
);

    wire [7:0] mem0;
    wire [7:0] mem1;
    wire [7:0] mem2;
    wire [7:0] mem3;

    wire store0;
    wire store1;
    wire store2;
    wire store3;

    
    assign store0 = store & (addr == 2'b00);
    assign store1 = store & (addr == 2'b01);
    assign store2 = store & (addr == 2'b10);
    assign store3 = store & (addr == 2'b11);

    
    byte_memory byte0(
        .data(data),
        .store(store0),
        .memory(mem0)
    );

    byte_memory byte1(
        .data(data),
        .store(store1),
        .memory(mem1)
    );

    byte_memory byte2(
        .data(data),
        .store(store2),
        .memory(mem2)
    );

    byte_memory byte3(
        .data(data),
        .store(store3),
        .memory(mem3)
    );

    
    always @(*) begin
        case (addr)
            2'b00: memory = mem0;
            2'b01: memory = mem1;
            2'b10: memory = mem2;
            2'b11: memory = mem3;
            default: memory = 8'b00000000;
        endcase
    end

endmodule
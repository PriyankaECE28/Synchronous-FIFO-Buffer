`timescale 1ns/1ps

module fifo_tb;
    reg clk;
    reg rst_n;
    reg wr_en;
    reg rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full;
    wire empty;

    // Instantiate FIFO
    fifo #( .DATA_WIDTH(8), .DEPTH(16), .ADDR_WIDTH(4) ) uut (
        .clk(clk), .rst_n(rst_n), .wr_en(wr_en), .rd_en(rd_en),
        .data_in(data_in), .data_out(data_out), .full(full), .empty(empty)
    );

    always #10 clk = ~clk;
    initial begin
        // GTKWave dumping
        $dumpfile("fifo_waveform.vcd");
        $dumpvars(0, fifo_tb);
        clk = 0; rst_n = 0; wr_en = 0; rd_en = 0; data_in = 0;
        #25 rst_n = 1; 

        // Write data until Full 
        $display("Writing data...");
        repeat(16) begin
            @(posedge clk);
            if (!full) begin
                wr_en = 1;
                data_in = data_in + 1;
            end
        end
        @(posedge clk); wr_en = 0;
        #20;

        //  Read data until Empty 
        $display("Reading data...");
        repeat(16) begin
            @(posedge clk);
            if (!empty) rd_en = 1;
        end
        @(posedge clk); rd_en = 0;
        
        #40;
        $finish;
    end
endmodule

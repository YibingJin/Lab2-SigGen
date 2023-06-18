module counter #(
    parameter WIDTH = 8
) (
    // interface signals
    input logic              clk,// clock
    input logic              rst,// rst
    input logic              en,// load counter from data
    input logic [WIDTH-1:0]  v, // value to preload
    output logic [WIDTH-1:0] count1,
    output logic [WIDTH-1:0] count2
);

// always_ff @(posedge clk,negedge rst)
//     if (rst) count<={WIDTH{1'b0}};
//     else     count<=count+{{WIDTH-1{1'b0}},en};

always_ff @(posedge clk)
    if (rst)  
    begin
         count1<={WIDTH{1'b0}};
         count2<={WIDTH{1'b0}};
    end
    else         
    begin
        count1 <=  en ? count1+{{WIDTH-1{1'b0}},1'b1} : count1+{{WIDTH-1{1'b0}},1'b0};
        count2 <= count1+v;
    end
      //step 1
    // else           count<= en ? count+{{WIDTH-1{1'b0}},1'b1} : count+{{WIDTH-1{1'b0}},1'b0};



endmodule

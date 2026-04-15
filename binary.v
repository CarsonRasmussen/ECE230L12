module binary(
    input w,
    input clk,
    input Reset,
    input [2:0] State,
    output z
);

    wire [2:0] Next;

    dff zero(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(Reset),
        .Q(State[0])
    );

    dff one(
    .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(Reset),
        .Q(State[1])
    );
    
    dff two(
    .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(Reset),
        .Q(State[2])
    );

    assign z = (~w & ~State[2] & State[1] & ~State[0]) | (w & ~State[2] & State[1] & ~State[0]) | (~w & State[2] & ~State[1] & ~State[0]) | (w & State[2] & ~State[1] & ~State[0]);
    assign Next[0] = (~w & ~State[2] & ~State[1] & ~State[0]) | (w & ~State[2] & ~State[1] & ~State[0]) | (w & ~State[2] & ~State[1] & State[0]) | (w & ~State[2] & State[1] & ~State[0]) | (~w & ~State[2] & State[1] & State[0]) | (~w & State[2] & ~State[1] & ~State[0]);
    assign Next[1] = (w & ~State[2] & ~State[1] & ~State[0]) | (~w & ~State[2] & ~State[1] & State[0]) | (w & ~State[2] & ~State[1] & State[0]) | (~w & ~State[2] & State[1] & ~State[0]) | (w & ~State[2] & State[1] & ~State[0]);
    assign Next[2] = (w & ~State[2] & State[1] & State[0]) | (w & State[2] & ~State[1] & ~State[0]);

endmodule
module onehot(
    input w,
    input clk,
    input Reset,
    input Astate, Bstate, Cstate, Dstate, Estate,
    output z
);
    wire Anext, Bnext, Cnext, Dnext, Enext;

    dff Adff(
        .Default(1'b1),
        .reset(Reset),
        .D(Anext),
        .clk(clk),
        .Q(Astate)
    );

    dff Bdff(
        .Default(1'b0),
        .reset(Reset),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate)
    );

    dff Cdff(
        .Default(1'b0),
        .reset(Reset),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate)
    );
        
    dff Ddff(
        .Default(1'b0),
        .reset(Reset),
        .D(Dnext),
        .clk(clk),
        .Q(Dstate)
     );
        
    dff Edff(
        .Default(1'b0),
        .reset(Reset),
        .D(Enext),
        .clk(clk),
        .Q(Estate)
    );

    assign z = Cstate | Estate;

    assign Anext = 1'b0;
    assign Bnext = (~w & Dstate) | (~w & Estate) | (~w & Astate);
    assign Cnext = (~w & Bstate) | (~w & Cstate);
    assign Dnext = (w & Astate) | (w & Bstate) | (w & Cstate);
    assign Enext = (w & Dstate) | (w & Estate);
endmodule
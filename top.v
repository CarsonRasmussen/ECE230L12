module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    onehot part1(
        .w(sw),
        .clk(btnC),
        .Reset(btnU),
        .z(led[0]),
        .Astate(led[2]),
        .Bstate(led[3]),
        .Cstate(led[4]),
        .Dstate(led[5]),
        .Estate(led[6])
    );
    
    binary part2(
        .w(sw),
        .clk(btnC),
        .Reset(btnU),
        .State(led[9:7]),
        .z(led[1])
    );

endmodule
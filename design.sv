module comparator(a,b,aeb,agb,alb,aleb,ageb,aneb);
    input [7:0] a;
    input [7:0] b;

    output aeb;
    output agb;
    output alb;
    output aleb;
    output ageb;
    output aneb;

    assign aeb=(a==b);
    assign alb=(a<b);
    assign agb=(a>b);

    assign aleb=(a<=b);
    assign ageb=(a>=b);
    assign aneb=(a!=b);


endmodule
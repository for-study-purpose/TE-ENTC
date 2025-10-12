clc;
clear all;
close all;
code_length = 0;
x = input("Enter the number of symbols: ");
for m = 1:x
    symbols(m) = input("Enter the symbol number: ");
    p(m) = input("Enter the probability: ");

end
Hx = 0;
for m = 1:x
    [dict,avglen] = huffmandict(symbols,p);
    hcode = huffmanenco(m,dict);
    display(hcode);

    dsig = huffmandeco(hcode,dict);
    display(dsig);

    code_length = length(hcode);
    display(code_length);

end
display(Hx);
Efficiency = (Hx/avglen)*100

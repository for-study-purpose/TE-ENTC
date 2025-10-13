clc;
clear all;
close all;

% Input number of symbols
x = input("Enter the number of symbols: ");

symbols = zeros(1, x);
p = zeros(1, x);

% Input symbols and their probabilities
for m = 1:x
    symbols(m) = input("Enter the symbol number: ");
    p(m) = input("Enter the probability: ");
end

% Check if probabilities sum to 1 (optional but recommended)
if abs(sum(p) - 1) > 1e-6
    error('Probabilities must sum to 1.');
end

% Calculate entropy
Hx = -sum(p .* log2(p));

% Create Huffman dictionary
[dict, avglen] = huffmandict(symbols, p);

% Example message (you can input this as well)
message = symbols; % or [symbols(1), symbols(2), ...]

% Encode the message
hcode = huffmanenco(message, dict);
disp('Encoded Huffman Code:');
disp(hcode);

% Decode
dsig = huffmandeco(hcode, dict);
disp('Decoded Signal:');
disp(dsig);

% Code length
code_length = length(hcode);
disp(['Code Length: ', num2str(code_length)]);

% Display entropy
disp(['Entropy (Hx): ', num2str(Hx)]);

% Efficiency
Efficiency = (Hx / avglen) * 100;
disp(['Efficiency: ', num2str(Efficiency), '%']);

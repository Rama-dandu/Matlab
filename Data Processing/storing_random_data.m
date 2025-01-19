
%% program to store random data in excel file

clc;
clear all;
close all;

data = randn(1,100);

%transpose the data to store it vertically
data = data';

xlswrite('random_data.xlsx',data);
disp('data stored in excel');
%% Program to perform matrix operations like addition, subtraction, multiplication and division

clc;
clear all;
close all;

%% Basics

% row vector
row = [1 2 3];

% column vector
column = [4; 5; 6];

% 2x3 matrix
matrix = [1 2 3; 4 5 6];

% zero matrix
zero_matrix = zeros(3,3);
disp('Zero matrix: '),disp(zero_matrix);

one_matrix = ones(3,3);
disp('Ones matrix: '),disp(one_matrix);

identity_matrix = eye(3);
disp('Identity matrix: '),disp(identity_matrix);

%% Matrix arithematic operations

a = [1 2; 3 4];
b = [5 6; 7 8];

sum = a+b;
sub = a-b;
mul_matrix = a*b;
mul_element = a.*b;

div_matrix = a/b; % div = a.b^-1 means first find the b^-1 = 1/det(b) * adj(b). then multiply with a
div_element = a./b;

disp('Addition: '), disp(sum);
disp('Subtraction: '), disp(sub);
disp('Multiplication(Matrix): '), disp(mul_matrix);
disp('Multiplication(Element): '), disp(mul_element);
disp('Division(Matrix): '), disp(div_matrix);
disp('Division(Element): '), disp(div_element);

%% Transpose, inverse of matrix

matrix_1 = [1 2 3; 4 5 6];

% Transpose of matrix
matrix_t = matrix_1';
disp('Transpose of matrix: '), disp(matrix_t);


matrix_2 = [1 2; 3 4];

% Inverse of matrix
matrix_i = inv(matrix_2);
disp('Inverse of matrix: '), disp(matrix_i);

% Determinent of matrix
matrix_d = det(matrix_2);
disp('Determinent of matrix: '), disp(matrix_d);

%% Accessing matrix elements

M = [10 20 30 40; 50 60 70 80; 90 100 110 120];

% accessing a particular element
element = M(4);
element = M(1,3);
disp(['Element: ',num2str(element)]);

% length of matrix
len = length(M);
disp(['Length of matrix: ', num2str(len)]);

% accessing entire row
row = M(2,:);
disp(['Row of Matrix: ',num2str(row)]);

% accessing the entire column
column = M(:,1);
disp('Column of Matrix: ');
disp(column);

%% Matrix functions

M = [10 20; 40 50; 80 90];
disp('Matrix M:');
disp(M);

% Size of the matrix
[r, c] = size(M);
disp(['Rows: ', num2str(r), ', Columns: ', num2str(c)]);

% Length of the matrix
len = length(M);
disp(['Length of matrix: ', num2str(len)]);

% max and min values
max_ele = max(M(:));
min_ele = min(M(:));
disp(['max element: ',num2str(max_ele),' min element: ',num2str(min_ele)]);

% Visualize a matrix as an image
imagesc(M);
colorbar;
title('Matrix Visualization');








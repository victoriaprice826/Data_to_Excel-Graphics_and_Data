function [ A ] = VerifyTable( A )
%Verifying table length- Eliminate Spaces
%   Program will evaluate table A that is imported remove excess rows over
%   5 and then remove extra spaces that are found in the table which will
%   cause an alignment error.  
%   Function will verify that table is a uniform rectangle 
%       Inputs: table A
%       Outputs: table A modified
%   Created by Victoria Price (Fall 2016, Matlab 2014a)

%% Removes excess rows over 5 and verifies no spacing
[r,c] = size(A);

if  r<=5        %correct rows
    if ismissing(A)== 1     %fix columns if there is extra spaces
        A(row,col:end-1)=A(row,col+1:end)
        A(row,end)= []
    end
elseif r > 5    %incorrect rows
    A((6:end),:) = [];
    if ismissing(A)== 1     %fix columns if there is extra spaces
        A(row,col:end-1)=A(row,col+1:end)
        A(row,end)= []
    end
end


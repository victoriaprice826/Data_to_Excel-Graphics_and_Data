%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exports Quick Basic txt files to Excel Spreadsheet
%
% This script will take text files produced by P. DeVita's QuickBasic
% program and will put them into a single spreadsheet in their specified
% place within the worksheet.
%   Note: Spreadsheet sheet conditions must be labeled as C1, C2, etc. to
%   process correctly.  Subject numbers should be 2 digits long and should be
%   available in the spreadsheet beforehand.
%   Directory to spreadsheet and files must be defined if not in current
%   folder.
%   Input: txt files with data processed through QuickBasics.  Naming
%   convention: S##C#.txt
%   Output: option for each condition having a folder with trial graphs for
%   various data (function GraphTrials) and data exported to spreadsheet
%   (first 5 trials)
% Creator: Victoria Price, Fall 2016 (Matlab 2014a)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;

%% Adjustable Variables for spreadsheets
% define directory to data files and Spreadsheet name
DIRECTORY = cd('X:\Research\Foam_Running - Fall 2015\Prjt_Materials');
Spreadsheet = 'MatlabPrjt_Fall2016.xlsx';

Again='Y';
while Again=='Y'||Again=='y';
    %% define subject number
    prompt='What is the Subject Number (ex:S01)? S';
    sbjtnum = input(prompt, 's');
    
    %% upload condition file, export into specific spreadsheet based on subject number and condition number
    i = 1;
    %% Create Trials graphs to compare trial data
    GraphLoaded= false; 
    PromptGraphs= 'Do you want to load graphs of condition trials (Y/N)? ';
    AnsGraphs= input(PromptGraphs, 's');
    if AnsGraphs == 'Y'||AnsGraphs=='y';
       GraphLoaded= GraphTrials(sbjtnum);
       if GraphLoaded == true
           disp('Graphs uploaded successfully');
       else
           disp ('Error loading graphs.  Please revise CSV files')
       end    
    end

    %% data importing and exporting
    while i < 10
        if exist(strcat('S', sbjtnum, 'C', num2str(i), '.TXT'))== 2
            
            %% Import File
            file = strcat('S', sbjtnum, 'C', num2str(i), '.TXT');
            ConditionData = importfileTable(file);      %Function importfileTable imports data as table
            ConditionData(:,{'Position'}) = [];  %Removes the position column (no data erased in column)
            
            %% Verify table is at most 5 rows and has all columns of information to fit in spreadsheet
            ConditionData= VerifyTable(ConditionData);
            ConData = table2cell(ConditionData);
            
            %% Export to worksheet in spreadsheet
            ConLabel = strcat('C', num2str(i)); % define worksheet label
            [~,~,SubjectID_DataFile]=xlsread(Spreadsheet, ConLabel,'B1:B114');   %Read SubjectID column in spreadsheet
            [row,~]=find(strcmp(SubjectID_DataFile,sbjtnum));   %Find row with SujectID
            StartCell= strcat('C', num2str(row));   %cell where data should start to be pasted into spreadsheet
            xlswrite(Spreadsheet, ConData, ConLabel,StartCell)
            
            %% Verification files ran
            fprintf('File %s inputted into %s\n\n', file, Spreadsheet)
            i = i +1;
            
        else
            i = i +1;
        end
    end
    %% Question if more data needs to be run
    StartPrompt= 'Are there more subjects to process (Y/N)? ';
    Again= input(StartPrompt, 's');
    if Again == 'N';
        break
    end
end
disp('Program Finished');
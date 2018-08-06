
%% load Emotiv Data
for subject = 1 : 44

    if (subject == 1) filename = 'Subject1.csv';
    elseif (subject == 2) filename = 'Subject2.csv';
    elseif (subject == 3) filename = 'Subject3.csv';
    elseif (subject == 4) filename = 'Subject4.csv';
    elseif (subject == 5) filename = 'Subject5.csv';
    elseif (subject == 6) filename = 'Subject6.csv';
    elseif (subject == 7) filename = 'Subject7.csv';
    elseif (subject == 8) filename = 'Subject8.csv';
    elseif (subject == 9) filename = 'Subject9.csv';
    elseif (subject == 10) filename = 'Subject10.csv';
    elseif (subject == 11) filename = 'Subject11.csv';
    elseif (subject == 12) filename = 'Subject12.csv';
    elseif (subject == 13) filename = 'Subject13.csv';
    elseif (subject == 14) filename = 'Subject14.csv';
    elseif (subject == 15) filename = 'Subject15.csv';
    elseif (subject == 16) filename = 'Subject16.csv';
    elseif (subject == 17) filename = 'Subject17.csv';
    elseif (subject == 18) filename = 'Subject18.csv';
    elseif (subject == 19) filename = 'Subject19.csv';
    elseif (subject == 20) filename = 'Subject20.csv';
    elseif (subject == 21) filename = 'Subject21.csv';
    elseif (subject == 22) filename = 'Subject22.csv';
    elseif (subject == 23) filename = 'Subject23.csv';
    elseif (subject == 24) filename = 'Subject24.csv';
    elseif (subject == 25) filename = 'Subject25.csv';
    elseif (subject == 26) filename = 'Subject26.csv';
    elseif (subject == 27) filename = 'Subject27.csv';
    elseif (subject == 28) filename = 'Subject28.csv';
    elseif (subject == 29) filename = 'Subject29.csv';
    elseif (subject == 30) filename = 'Subject30.csv';
    elseif (subject == 31) filename = 'Subject31.csv';
    elseif (subject == 32) filename = 'Subject32.csv';
    elseif (subject == 33) filename = 'Subject33.csv';
    elseif (subject == 34) filename = 'Subject34.csv';
    elseif (subject == 35) filename = 'Subject35.csv';
    elseif (subject == 36) filename = 'Subject36.csv';
    elseif (subject == 37) filename = 'Subject37.csv';
    elseif (subject == 38) filename = 'Subject38.csv';
    elseif (subject == 39) filename = 'Subject39.csv';
    elseif (subject == 40) filename = 'Subject40.csv';
    elseif (subject == 41) filename = 'Subject41.csv';
    elseif (subject == 42) filename = 'Subject42.csv';
    elseif (subject == 43) filename = 'Subject43.csv';
    elseif (subject == 44) filename = 'Subject44.csv';    
    end



delimiter = ',';

%% Format string for each line of text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
Time_index = dataArray{:, 1};
Channel_1 = dataArray{:, 2};
Channel_2 = dataArray{:, 3};
Channel_3 = dataArray{:, 4};
Channel_4 = dataArray{:, 5};
Channel_5 = dataArray{:, 6};
Channel_6 = dataArray{:, 7};
Channel_7 = dataArray{:, 8};
Channel_8 = dataArray{:, 9};
Channel_9 = dataArray{:, 10};
Channel_10 = dataArray{:, 11};
Channel_11 = dataArray{:, 12};
Channel_12 = dataArray{:, 13};
Channel_13 = dataArray{:, 14};
Channel_14 = dataArray{:, 15};

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;


%% Artifact Removal 1
sig_us = Channel_1;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon1 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 2
sig_us = Channel_2;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon2 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 3
sig_us = Channel_3;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon3 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 4
sig_us = Channel_4;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon4 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 5
sig_us = Channel_5;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon5 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 6
sig_us = Channel_6;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon6 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 7
sig_us = Channel_7;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon7 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 8
sig_us = Channel_8;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon8 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 9
sig_us = Channel_9;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon9 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 10
sig_us = Channel_10;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon10 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 11
sig_us = Channel_11;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon11 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 12
sig_us = Channel_12;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon12 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 13
sig_us = Channel_13;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon13 = [sig_new_1 sig_new2 sig_new_3'];

%% Artifact Removal 14
sig_us = Channel_14;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 128;           % Sampling frequency of Emotiv
sig_new_1 = artifact_removal_eeg_BCI_2(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new2 = artifact_removal_eeg_BCI_2(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new2)+1:end);
sig_new_3 = sig_us_3 - mean(sig_us_3);
sig_recon14 = [sig_new_1 sig_new2 sig_new_3'];



%% Combine all Data and save in a csv file

Recon_data =[Time_index sig_recon1' sig_recon2' sig_recon3' sig_recon4' sig_recon5' sig_recon6' sig_recon7' sig_recon8' sig_recon9' sig_recon10' sig_recon11' sig_recon12' sig_recon13' sig_recon14'];


    if (subject == 1) file = 'Subject1';
    elseif (subject == 2) file = 'Subject2';
    elseif (subject == 3) file = 'Subject3';
    elseif (subject == 4) file = 'Subject4';
    elseif (subject == 5) file = 'Subject5';
    elseif (subject == 6) file = 'Subject6';
    elseif (subject == 7) file = 'Subject7';
    elseif (subject == 8) file = 'Subject8';
    elseif (subject == 9) file = 'Subject9';
    elseif (subject == 10) file = 'Subject10';
    elseif (subject == 11) file = 'Subject11';
    elseif (subject == 12) file = 'Subject12';
    elseif (subject == 13) file = 'Subject13';
    elseif (subject == 14) file = 'Subject14';
    elseif (subject == 15) file = 'Subject15';
    elseif (subject == 16) file = 'Subject16';
    elseif (subject == 17) file = 'Subject17';
    elseif (subject == 18) file = 'Subject18';
    elseif (subject == 19) file = 'Subject19';
    elseif (subject == 20) file = 'Subject20';
    elseif (subject == 21) file = 'Subject21';
    elseif (subject == 22) file = 'Subject22';
    elseif (subject == 23) file = 'Subject23';
    elseif (subject == 24) file = 'Subject24';
    elseif (subject == 25) file = 'Subject25';
    elseif (subject == 26) file = 'Subject26';
    elseif (subject == 27) file = 'Subject27';
    elseif (subject == 28) file = 'Subject28';
    elseif (subject == 29) file = 'Subject29';
    elseif (subject == 30) file = 'Subject30';
    elseif (subject == 31) file = 'Subject31';
    elseif (subject == 32) file = 'Subject32';
    elseif (subject == 33) file = 'Subject33';
    elseif (subject == 34) file = 'Subject34';
    elseif (subject == 35) file = 'Subject35';
    elseif (subject == 36) file = 'Subject36';
    elseif (subject == 37) file = 'Subject37';
    elseif (subject == 38) file = 'Subject38';
    elseif (subject == 39) file = 'Subject39';
    elseif (subject == 40) file = 'Subject40';
    elseif (subject == 41) file = 'Subject41';
    elseif (subject == 42) file = 'Subject42';
    elseif (subject == 43) file = 'Subject43';
    elseif (subject == 44) file = 'Subject44';    
    end

folderPath = 'Our_Code\Data_Emotiv\';
s2 = '_Recon_data';
save(strcat(folderPath, file, s2), 'Recon_data');


end

%% Plot Results
% t = (0:length(sig_us)-1)./Fs;
% plot(t,sig_us, 'r'); hold on; plot(t,sig_recon);
% legend('Before Removal','After Removal');
% ylabel('Signal Amplitude'); xlabel('Time, Sec')

%% load Emotiv Data
for subject = 1 :23

    if (subject == 1) filename = '1_1521939_Namaki_EEG.csv';
    elseif (subject == 2) filename = '2_1430045_Mansura_EEG.csv';
    elseif (subject == 3) filename = '3_1521786_Nikita_LoadShedding_EEG.csv';
    elseif (subject == 4) filename = '4_1521893_Kashfia_EEG.csv';
    elseif (subject == 5) filename = '5_1521947_Mahapara_EEG.csv';
    elseif (subject == 6) filename = '6_1530887_Jahed_EEG.csv';
    elseif (subject == 7) filename = '7_1430853_Tusher_EEG.csv';
    elseif (subject == 8) filename = '8_1430163_TamTusher_EEG.csv';
    elseif (subject == 9) filename = '9_1410703_Tausif_EEG.csv';
    elseif (subject == 10) filename = '10_1630444_Pias_EEG.csv';
    elseif (subject == 11) filename = '11_1630495_Niaz_EEG.csv';
    elseif (subject == 12) filename = '12_1530934_Rifat_EEG.csv';
    elseif (subject == 13) filename = '13_1530990_Emu_EEG.csv';
    elseif (subject == 14) filename = '14_1521597_Momtahina_EEG.csv';
    elseif (subject == 15) filename = '15_1520120_Nadia_EEG.csv';
    elseif (subject == 16) filename = '16_1530721_Sakib_EEG.csv';
    elseif (subject == 17) filename = '17_1520951_Pervez_EEG.csv';
    elseif (subject == 18) filename = '18_1430497_Zahid_EEG.csv';
    elseif (subject == 19) filename = '19_1410397_Zemim_EEG.csv';
    elseif (subject == 20) filename = '20_1521956_Minhazul_EEG.csv';
    elseif (subject == 21) filename = '21_1520982_Rizvi_EEG.csv';
    elseif (subject == 22) filename = '22_1521802_Mony_EEG.csv';
    elseif (subject == 23) filename = '23_1521957_Shafayet_EEG.csv';
    end





delimiter = ',';

%% Format string for each line of text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%[^\n\r]';

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

%% Create output variable
Time_index = dataArray{:, 1};
Channel_1 = dataArray{:, 2};
Channel_2 = dataArray{:, 3};
Channel_3 = dataArray{:, 4};
Channel_4 = dataArray{:, 5};

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;


%% Artifact Removal Channel 1
sig_us = Channel_1;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 220;           % Sampling frequency of Muse
sig_new_1 = artifact_removal_eeg_BCI(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new_2 = artifact_removal_eeg_BCI(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new_2)+1:end);
sig_new_3 = artifact_removal_eeg_BCI(sig_us_3, Fs);
sig_us_4 = sig_us(length(sig_new_1)+length(sig_new_2)+length(sig_new_3)+1:end);
sig_new_4 = artifact_removal_eeg_BCI(sig_us_4, Fs);
sig_us_5 = sig_us(length(sig_new_1)+length(sig_new_2)+length(sig_new_3)+length(sig_new_4)+1:end);
sig_new_5 = sig_us_5 - mean(sig_us_5);
sig_recon1 = [sig_new_1 sig_new_2 sig_new_3 sig_new_4 sig_new_5'];

%% Artifact Removal Channel 2
sig_us = Channel_2;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 220;           % Sampling frequency of Muse
sig_new_1 = artifact_removal_eeg_BCI(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new_2 = artifact_removal_eeg_BCI(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new_2)+1:end);
sig_new_3 = artifact_removal_eeg_BCI(sig_us_3, Fs);
sig_us_4 = sig_us(length(sig_new_1)+length(sig_new_2)+length(sig_new_3)+1:end);
sig_new_4 = artifact_removal_eeg_BCI(sig_us_4, Fs);
sig_us_5 = sig_us(length(sig_new_1)+length(sig_new_2)+length(sig_new_3)+length(sig_new_4)+1:end);
sig_new_5 = sig_us_5 - mean(sig_us_5);
sig_recon2 = [sig_new_1 sig_new_2 sig_new_3 sig_new_4 sig_new_5'];

%% Artifact Removal Channel 3
sig_us = Channel_3;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 220;           % Sampling frequency of Muse
sig_new_1 = artifact_removal_eeg_BCI(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new_2 = artifact_removal_eeg_BCI(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new_2)+1:end);
sig_new_3 = artifact_removal_eeg_BCI(sig_us_3, Fs);
sig_us_4 = sig_us(length(sig_new_1)+length(sig_new_2)+length(sig_new_3)+1:end);
sig_new_4 = artifact_removal_eeg_BCI(sig_us_4, Fs);
sig_us_5 = sig_us(length(sig_new_1)+length(sig_new_2)+length(sig_new_3)+length(sig_new_4)+1:end);
sig_new_5 = sig_us_5 - mean(sig_us_5);
sig_recon3 = [sig_new_1 sig_new_2 sig_new_3 sig_new_4 sig_new_5'];

%% Artifact Removal Channel 4
sig_us = Channel_4;  % Channel_#X data sequence
sig_us = sig_us-mean(sig_us);    % Removing DC offset
Fs = 220;           % Sampling frequency of Muse
sig_new_1 = artifact_removal_eeg_BCI(sig_us, Fs); % Apply SWT based artifact removal algorithm
sig_us_2 = sig_us(length(sig_new_1)+1:end);
sig_new_2 = artifact_removal_eeg_BCI(sig_us_2, Fs);
sig_us_3 = sig_us(length(sig_new_1)+length(sig_new_2)+1:end);
sig_new_3 = artifact_removal_eeg_BCI(sig_us_3, Fs);
sig_us_4 = sig_us(length(sig_new_1)+length(sig_new_2)+length(sig_new_3)+1:end);
sig_new_4 = artifact_removal_eeg_BCI(sig_us_4, Fs);
sig_us_5 = sig_us(length(sig_new_1)+length(sig_new_2)+length(sig_new_3)+length(sig_new_4)+1:end);
sig_new_5 = sig_us_5 - mean(sig_us_5);
sig_recon4 = [sig_new_1 sig_new_2 sig_new_3 sig_new_4 sig_new_5'];


%% Combine all Data and save in a csv file

Recon_data =[Time_index sig_recon1' sig_recon2' sig_recon3' sig_recon4'];

if (subject == 1) file = '1_1521939_Namaki_EEG';
    elseif (subject == 2) file = '2_1430045_Mansura_EEG';
    elseif (subject == 3) file = '3_1521786_Nikita_LoadShedding_EEG';
    elseif (subject == 4) file = '4_1521893_Kashfia_EEG';
    elseif (subject == 5) file = '5_1521947_Mahapara_EEG';
    elseif (subject == 6) file = '6_1530887_Jahed_EEG';
    elseif (subject == 7) file = '7_1430853_Tusher_EEG';
    elseif (subject == 8) file = '8_1430163_TamTusher_EEG';
    elseif (subject == 9) file = '9_1410703_Tausif_EEG';
    elseif (subject == 10) file = '10_1630444_Pias_EEG';
    elseif (subject == 11) file = '11_1630495_Niaz_EEG';
    elseif (subject == 12) file = '12_1530934_Rifat_EEG';
    elseif (subject == 13) file = '13_1530990_Emu_EEG';
    elseif (subject == 14) file = '14_1521597_Momtahina_EEG';
    elseif (subject == 15) file = '15_1520120_Nadia_EEG';
    elseif (subject == 16) file = '16_1530721_Sakib_EEG';
    elseif (subject == 17) file = '17_1520951_Pervez_EEG';
    elseif (subject == 18) file = '18_1430497_Zahid_EEG';
    elseif (subject == 19) file = '19_1410397_Zemim_EEG';
    elseif (subject == 20) file = '20_1521956_Minhazul_EEG';
    elseif (subject == 21) file = '21_1520982_Rizvi_EEG';
    elseif (subject == 22) file = '22_1521802_Mony_EEG';
    elseif (subject == 23) file = '23_1521957_Shafayet_EEG';
end


folderPath = 'Our_Code\Data_Muse\';
s2 = '_Recon_data';
save(strcat(folderPath, file, s2), 'Recon_data');




end

function splitEEGIntoDifferentSubjectsFromOneSubject_Emotiv(subject, noOfSubjectsToConvertTo,data)

    if (data == 1)
        if (subject == 1) eeg = csvread('Data_Emotiv\Subject1.csv');
        elseif (subject == 2) eeg = csvread('Data_Emotiv\Subject2.csv');
        elseif (subject == 3) eeg = csvread('Data_Emotiv\Subject3.csv');
        elseif (subject == 4) eeg = csvread('Data_Emotiv\Subject4.csv');
        elseif (subject == 5) eeg = csvread('Data_Emotiv\Subject5.csv');
        elseif (subject == 6) eeg = csvread('Data_Emotiv\Subject6.csv');
        elseif (subject == 7) eeg = csvread('Data_Emotiv\Subject7.csv');
        elseif (subject == 8) eeg = csvread('Data_Emotiv\Subject8.csv');
        elseif (subject == 9) eeg = csvread('Data_Emotiv\Subject9.csv');
        elseif (subject == 10) eeg = csvread('Data_Emotiv\Subject10.csv');
        elseif (subject == 11) eeg = csvread('Data_Emotiv\Subject11.csv');
        elseif (subject == 12) eeg = csvread('Data_Emotiv\Subject12.csv');
        elseif (subject == 13) eeg = csvread('Data_Emotiv\Subject13.csv');
        elseif (subject == 14) eeg = csvread('Data_Emotiv\Subject14.csv');
        elseif (subject == 15) eeg = csvread('Data_Emotiv\Subject15.csv');
        elseif (subject == 16) eeg = csvread('Data_Emotiv\Subject16.csv');
        elseif (subject == 17) eeg = csvread('Data_Emotiv\Subject17.csv');
        elseif (subject == 18) eeg = csvread('Data_Emotiv\Subject18.csv');
        elseif (subject == 19) eeg = csvread('Data_Emotiv\Subject19.csv');
        elseif (subject == 20) eeg = csvread('Data_Emotiv\Subject20.csv');
        elseif (subject == 21) eeg = csvread('Data_Emotiv\Subject21.csv');
        elseif (subject == 22) eeg = csvread('Data_Emotiv\Subject22.csv');
        elseif (subject == 23) eeg = csvread('Data_Emotiv\Subject23.csv');
        elseif (subject == 24) eeg = csvread('Data_Emotiv\Subject24.csv');
        elseif (subject == 25) eeg = csvread('Data_Emotiv\Subject25.csv');
        elseif (subject == 26) eeg = csvread('Data_Emotiv\Subject26.csv');
        elseif (subject == 27) eeg = csvread('Data_Emotiv\Subject27.csv');
        elseif (subject == 28) eeg = csvread('Data_Emotiv\Subject28.csv');
        elseif (subject == 29) eeg = csvread('Data_Emotiv\Subject29.csv');
        elseif (subject == 30) eeg = csvread('Data_Emotiv\Subject30.csv');
        elseif (subject == 31) eeg = csvread('Data_Emotiv\Subject31.csv');
        elseif (subject == 32) eeg = csvread('Data_Emotiv\Subject32.csv');
        elseif (subject == 33) eeg = csvread('Data_Emotiv\Subject33.csv');
        elseif (subject == 34) eeg = csvread('Data_Emotiv\Subject34.csv');
        elseif (subject == 35) eeg = csvread('Data_Emotiv\Subject35.csv');
        elseif (subject == 36) eeg = csvread('Data_Emotiv\Subject36.csv');
        elseif (subject == 37) eeg = csvread('Data_Emotiv\Subject37.csv');
        elseif (subject == 38) eeg = csvread('Data_Emotiv\Subject38.csv');
        elseif (subject == 39) eeg = csvread('Data_Emotiv\Subject39.csv');
        elseif (subject == 40) eeg = csvread('Data_Emotiv\Subject40.csv');
        elseif (subject == 41) eeg = csvread('Data_Emotiv\Subject41.csv');
        elseif (subject == 42) eeg = csvread('Data_Emotiv\Subject42.csv');
        elseif (subject == 43) eeg = csvread('Data_Emotiv\Subject43.csv');
        elseif (subject == 44) eeg = csvread('Data_Emotiv\Subject44.csv');    
        end
    elseif(data == 2 || data == 3)
        if (subject == 1) load('Data_Emotiv\Subject1_Recon_data.mat');
        elseif (subject == 2) load('Data_Emotiv\Subject2_Recon_data.mat');
        elseif (subject == 3) load('Data_Emotiv\Subject3_Recon_data.mat');
        elseif (subject == 4) load('Data_Emotiv\Subject4_Recon_data.mat');
        elseif (subject == 5) load('Data_Emotiv\Subject5_Recon_data.mat');
        elseif (subject == 6) load('Data_Emotiv\Subject6_Recon_data.mat');
        elseif (subject == 7) load('Data_Emotiv\Subject7_Recon_data.mat');
        elseif (subject == 8) load('Data_Emotiv\Subject8_Recon_data.mat');
        elseif (subject == 9) load('Data_Emotiv\Subject9_Recon_data.mat');
        elseif (subject == 10) load('Data_Emotiv\Subject10_Recon_data.mat');
        elseif (subject == 11) load('Data_Emotiv\Subject11_Recon_data.mat');
        elseif (subject == 12) load('Data_Emotiv\Subject12_Recon_data.mat');
        elseif (subject == 13) load('Data_Emotiv\Subject13_Recon_data.mat');
        elseif (subject == 14) load('Data_Emotiv\Subject14_Recon_data.mat');
        elseif (subject == 15) load('Data_Emotiv\Subject15_Recon_data.mat');
        elseif (subject == 16) load('Data_Emotiv\Subject16_Recon_data.mat');
        elseif (subject == 17) load('Data_Emotiv\Subject17_Recon_data.mat');
        elseif (subject == 18) load('Data_Emotiv\Subject18_Recon_data.mat');
        elseif (subject == 19) load('Data_Emotiv\Subject19_Recon_data.mat');
        elseif (subject == 20) load('Data_Emotiv\Subject20_Recon_data.mat');
        elseif (subject == 21) load('Data_Emotiv\Subject21_Recon_data.mat');
        elseif (subject == 22) load('Data_Emotiv\Subject22_Recon_data.mat');
        elseif (subject == 23) load('Data_Emotiv\Subject23_Recon_data.mat');
        elseif (subject == 24) load('Data_Emotiv\Subject24_Recon_data.mat');
        elseif (subject == 25) load('Data_Emotiv\Subject25_Recon_data.mat');
        elseif (subject == 26) load('Data_Emotiv\Subject26_Recon_data.mat');
        elseif (subject == 27) load('Data_Emotiv\Subject27_Recon_data.mat');
        elseif (subject == 28) load('Data_Emotiv\Subject28_Recon_data.mat');
        elseif (subject == 29) load('Data_Emotiv\Subject29_Recon_data.mat');
        elseif (subject == 30) load('Data_Emotiv\Subject30_Recon_data.mat');
        elseif (subject == 31) load('Data_Emotiv\Subject31_Recon_data.mat');
        elseif (subject == 32) load('Data_Emotiv\Subject32_Recon_data.mat');
        elseif (subject == 33) load('Data_Emotiv\Subject33_Recon_data.mat');
        elseif (subject == 34) load('Data_Emotiv\Subject34_Recon_data.mat');
        elseif (subject == 35) load('Data_Emotiv\Subject35_Recon_data.mat');
        elseif (subject == 36) load('Data_Emotiv\Subject36_Recon_data.mat');
        elseif (subject == 37) load('Data_Emotiv\Subject37_Recon_data.mat');
        elseif (subject == 38) load('Data_Emotiv\Subject38_Recon_data.mat');
        elseif (subject == 39) load('Data_Emotiv\Subject39_Recon_data.mat');
        elseif (subject == 40) load('Data_Emotiv\Subject40_Recon_data.mat');
        elseif (subject == 41) load('Data_Emotiv\Subject41_Recon_data.mat');
        elseif (subject == 42) load('Data_Emotiv\Subject42_Recon_data.mat');
        elseif (subject == 43) load('Data_Emotiv\Subject43_Recon_data.mat');
        elseif (subject == 44) load('Data_Emotiv\Subject44_Recon_data.mat');    
        end
        eeg = Recon_data;
    end
    
    
    blankScreen1 = [];
    blankScreen2 = [];
    blankScreen3 = [];
    blankScreen4 = [];

    video1 = [];
    video2 = [];
    video3 = [];

    [r, c] = size(eeg);

    for i = 1:r
        if eeg(i, 1) < 7
            blankScreen1 = [blankScreen1; eeg(i, 2:end)];
            
        elseif eeg(i, 1) < 11
            continue;
        elseif eeg(i, 1) < 71
            video1 = [video1; eeg(i, 2:end)];
        elseif eeg(i, 1) < 75
            continue;
            
        elseif eeg(i, 1) < 80
            blankScreen2 = [blankScreen2; eeg(i, 2:end)];
            
        elseif eeg(i, 1) < 120
            continue;
        elseif eeg(i, 1) < 180
            video2 = [video2; eeg(i, 2:end)];
        elseif eeg(i, 1) < 221
            continue;
            
        elseif eeg(i, 1) < 227
            blankScreen3 = [blankScreen3; eeg(i, 2:end)];
            
        elseif eeg(i, 1) < 338
            continue;
        elseif eeg(i, 1) < 398
            video3 = [video3; eeg(i, 2:end)];
            
        else
            blankScreen4 = [blankScreen4; eeg(i, 2:end)];
        end
    end

    if (data == 3)    
        %Selecting data within 2 standard deviations
        video1 = selectDataWithin2SD(video1);
        video2 = selectDataWithin2SD(video2);
        video3 = selectDataWithin2SD(video3);
    end    
    %Total number of signals should be equivalent. So, the video with
    %the minimum number of signals is computed and all videos are chopped
    %accordingly
    minVideoSize = min([size(video1, 1), size(video2, 1), size(video3, 1)]);
    
    video1 = video1(1:minVideoSize, :);
    video2 = video2(1:minVideoSize, :);
    video3 = video3(1:minVideoSize, :);

    %Adding the data of the reference sensor
    reference1 = zeros(size(video1, 1), 1);
    reference2 = zeros(size(video2, 1), 1);
    reference3 = zeros(size(video3, 1), 1);

    video1 = [video1 reference1]';
    video2 = [video2 reference2]';
    video3 = [video3 reference3]';

    eegPerSubject = floor(length(video1) / noOfSubjectsToConvertTo);
%     fprintf('EEG Per Subject (Dataset 8): %i\n\n', eegPerSubject);

    first = 1;
    last = eegPerSubject;
    
    folderPath = 'MuseDataOneSubjectSplitInto10Subjects\';

    for i = 1:noOfSubjectsToConvertTo
        if i < 10
            s = '0';
        else
            s = '';
        end

        eeg = video1(:, first:last);
        save(strcat(folderPath, 'S0', s, int2str(i), 'a.mat'), 'eeg');

        eeg = video2(:, first:last);
        save(strcat(folderPath, 'S0', s, int2str(i), 'b.mat'), 'eeg');

        eeg = video3(:, first:last);
        save(strcat(folderPath, 'S0', s, int2str(i), 'c.mat'), 'eeg');

        first = last + 1;
        last = last + eegPerSubject;
    end
end
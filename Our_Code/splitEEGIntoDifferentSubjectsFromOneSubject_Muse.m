function splitEEGIntoDifferentSubjectsFromOneSubject_Muse(subject, noOfSubjectsToConvertTo, data)
  
        if(data == 1)
            if (subject == 1) eeg = csvread('Data_Muse\1_1521939_Namaki_EEG.csv');
            elseif (subject == 2) eeg = csvread('Data_Muse\2_1430045_Mansura_EEG.csv');
            elseif (subject == 3) eeg = csvread('Data_Muse\3_1521786_Nikita_LoadShedding_EEG.csv');
            elseif (subject == 4) eeg = csvread('Data_Muse\4_1521893_Kashfia_EEG.csv');
            elseif (subject == 5) eeg = csvread('Data_Muse\5_1521947_Mahapara_EEG.csv');
            elseif (subject == 6) eeg = csvread('Data_Muse\6_1530887_Jahed_EEG.csv');
            elseif (subject == 7) eeg = csvread('Data_Muse\7_1430853_Tusher_EEG.csv');
            elseif (subject == 8) eeg = csvread('Data_Muse\8_1430163_TamTusher_EEG.csv');
            elseif (subject == 9) eeg = csvread('Data_Muse\9_1410703_Tausif_EEG.csv');
            elseif (subject == 10) eeg = csvread('Data_Muse\10_1630444_Pias_EEG.csv');
            elseif (subject == 11) eeg = csvread('Data_Muse\11_1630495_Niaz_EEG.csv');
            elseif (subject == 12) eeg = csvread('Data_Muse\12_1530934_Rifat_EEG.csv');
            elseif (subject == 13) eeg = csvread('Data_Muse\13_1530990_Emu_EEG.csv');
            elseif (subject == 14) eeg = csvread('Data_Muse\14_1521597_Momtahina_EEG.csv');
            elseif (subject == 15) eeg = csvread('Data_Muse\15_1520120_Nadia_EEG.csv');
            elseif (subject == 16) eeg = csvread('Data_Muse\16_1530721_Sakib_EEG.csv');
            elseif (subject == 17) eeg = csvread('Data_Muse\17_1520951_Pervez_EEG.csv');
            elseif (subject == 18) eeg = csvread('Data_Muse\18_1430497_Zahid_EEG.csv');
            elseif (subject == 19) eeg = csvread('Data_Muse\19_1410397_Zemim_EEG.csv');
            elseif (subject == 20) eeg = csvread('Data_Muse\20_1521956_Minhazul_EEG.csv');
            elseif (subject == 21) eeg = csvread('Data_Muse\21_1520982_Rizvi_EEG.csv');
            elseif (subject == 22) eeg = csvread('Data_Muse\22_1521802_Mony_EEG.csv');
            elseif (subject == 23) eeg = csvread('Data_Muse\23_1521957_Shafayet_EEG.csv');
            end

        elseif(data == 2 || data == 3)
            if (subject == 1) load('Data_Muse\1_1521939_Namaki_EEG_Recon_data.mat');
            elseif (subject == 2) load('Data_Muse\2_1430045_Mansura_EEG_Recon_data.mat');
            elseif (subject == 3) load('Data_Muse\3_1521786_Nikita_LoadShedding_EEG_Recon_data.mat');
            elseif (subject == 4) load('Data_Muse\4_1521893_Kashfia_EEG_Recon_data.mat');
            elseif (subject == 5) load('Data_Muse\5_1521947_Mahapara_EEG_Recon_data.mat');
            elseif (subject == 6) load('Data_Muse\6_1530887_Jahed_EEG_Recon_data.mat');
            elseif (subject == 7) load('Data_Muse\7_1430853_Tusher_EEG_Recon_data.mat');
            elseif (subject == 8) load('Data_Muse\8_1430163_TamTusher_EEG_Recon_data.mat');
            elseif (subject == 9) load('Data_Muse\9_1410703_Tausif_EEG_Recon_data.mat');
            elseif (subject == 10) load('Data_Muse\10_1630444_Pias_EEG_Recon_data.mat');
            elseif (subject == 11) load('Data_Muse\11_1630495_Niaz_EEG_Recon_data.mat');
            elseif (subject == 12) load('Data_Muse\12_1530934_Rifat_EEG_Recon_data.mat');
            elseif (subject == 13) load('Data_Muse\13_1530990_Emu_EEG_Recon_data.mat');
            elseif (subject == 14) load('Data_Muse\14_1521597_Momtahina_EEG_Recon_data.mat');
            elseif (subject == 15) load('Data_Muse\15_1520120_Nadia_EEG_Recon_data.mat');
            elseif (subject == 16) load('Data_Muse\16_1530721_Sakib_EEG_Recon_data.mat');
            elseif (subject == 17) load('Data_Muse\17_1520951_Pervez_EEG_Recon_data.mat');
            elseif (subject == 18) load('Data_Muse\18_1430497_Zahid_EEG_Recon_data.mat');
            elseif (subject == 19) load('Data_Muse\19_1410397_Zemim_EEG_Recon_data.mat');
            elseif (subject == 20) load('Data_Muse\20_1521956_Minhazul_EEG_Recon_data.mat');
            elseif (subject == 21) load('Data_Muse\21_1520982_Rizvi_EEG_Recon_data.mat');
            elseif (subject == 22) load('Data_Muse\22_1521802_Mony_EEG_Recon_data.mat');
            elseif (subject == 23) load('Data_Muse\23_1521957_Shafayet_EEG_Recon_data.mat');
            end
            eeg = Recon_data;
        end

    eeg(:, 1) = eeg(:, 1) - min(eeg(:, 1));
    
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
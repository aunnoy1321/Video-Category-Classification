warning off;
clear all;
clc;

noOfSubjectsToConvertTo = 10;
numSplits = 1;
numSplitsOverlap = 1;
percentOverlap = 10;

% Apply SWT on the raw data and create seperate datasets for datasets SWT and SWTSD
% If there are no MAT files for every subject in folder OurCode\Data_Muse
% or OurCode\Data_Emotiv uncomment the following two lines
% art_rem_muse;
% art_rem_emotiv;

dataTypes = ["Raw", "SWT", "SWTSD"];

% To select dataset use 1, 2, 3
% 1 =  RAW data
% 2 =  SWT data
% 3 =  SWTSD data
for data = 1 : 3
    
    % To select device use 1 or 2
    % 1 = Muse 
    % 2 = Emotiv
    for device = 1 : 2
        if device == 1
            totalChannels = 4;
            channelNames = ["TP9", "AF7", "AF8", "TP10"];
            deviceName = "Muse";
            totalSubjects = 23;
        else
            totalChannels = 14;
            channelNames = ["AF3", "F7", "F3", "FC5", "T7", "P7", "O1", "O2", "P8", "T8", "FC6", "F4", "F8", "AF4"];
            deviceName = "Emotiv";
            totalSubjects = 44;
        end
        
        % To select channel
            % For Muse
                % 1 = TP9, 2 = AF7, 3 = AF8, 4 = TP10
            % For Emotiv
                % 1 = AF3, 2 = F7, 3 = F3, 4 = FC5, 5 = T7, 6 = P7, 7 = O1
                % 8 = O2, 9 = P8, 10 = T8, 11 = FC6, 12 = F4, 13 = F8, 14 = AF4        
        for channel = 1 : totalChannels
            fileName = strcat("Results\", deviceName, " ", channelNames(channel), " ", dataTypes(data), ".csv");
            fileID2 = fopen(fileName, 'w');
            
            sum = 0;
            count = 0;
            
            for subject = 1 : totalSubjects
                if (device == 1)
                    % for muse
                    % good data 1,2,3,4,5,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                    if subject == 6 || subject == 7 || subject == 8 || subject == 9
                       continue;
                    end
                elseif (device == 2)
                    % For Emotiv
                    % good data 1,2,3,4,5,10,28,32,34,,35,36,37,38,39,40,41,42,43,44
                    if subject == 6 || subject == 7 || subject == 8 ||...
                       subject == 9 || subject == 11 || subject == 12 || subject == 13 ||...
                       subject == 14 || subject == 15 || subject == 16 || subject == 17 ||...
                       subject == 18 || subject == 19 || subject == 20 || subject == 21 ||...
                       subject == 22 || subject == 23 || subject == 24 || subject == 25 ||...
                       subject == 26 || subject == 27 || subject == 29 ||...
                       subject == 30 || subject == 31 || subject == 33
                       continue;
                    end
                end

                %%%%% JUST FOR OUTPUT PURPOSES %%%%%
                fprintf('\nDATA: %s -- DEVICE: %s -- CHANNEL: %s\n', dataTypes(data), deviceName, channelNames(channel));
                fprintf('SUBJECT: %i\n\n\n', subject);
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                % LOAD DATA
                if (device == 1)
                    splitEEGIntoDifferentSubjectsFromOneSubject_Muse(subject, noOfSubjectsToConvertTo, data);
                elseif (device == 2)
                    splitEEGIntoDifferentSubjectsFromOneSubject_Emotiv(subject, noOfSubjectsToConvertTo, data);
                end

                % We used the number 10 for our dataset
                dataset = 10;
                sess = eegtoolkit.util.Session;
                sess.loadAll(dataset, numSplits, device); %Loads dataset

                for filter = 1 : 5
                    %%%%% JUST FOR OUTPUT PURPOSES %%%%%
                    if (filter == 1) continue;   
            %             if (filter == 1) flt = 'filt_IIRElliptic';
                    elseif (filter == 2) flt = 'filt_IIRChebIshevI';
            %             elseif (filter == 3) flt = 'filt_IIRChebIshevII';
                    elseif (filter == 3) continue;         
            %             elseif (filter == 4) flt = 'filt_FIREquiripple';
                    elseif (filter == 4) continue;
                    elseif (filter == 5) flt = 'filt_FIRLeastSquares'; 
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        

                    for featSelectNumber = 1 : 2
                        %%%%% JUST FOR OUTPUT PURPOSES %%%%%
                        if (featSelectNumber == 1) fS = 'PCA';
                        elseif (featSelectNumber == 2) fS = 'SVD';
                        end
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                        for extrNumber = 1 : 5
                            %%%%% JUST FOR OUTPUT PURPOSES %%%%%
            %                     if (extrNumber == 1) e = 'DWT';
                            if (extrNumber == 1)  continue;
            %                       elseif (extrNumber == 2) e = 'FFT';
                            elseif (extrNumber == 2)  continue;
                            elseif (extrNumber == 3) e = 'PWelch';
                            elseif (extrNumber == 4) e = 'PYAR';
            %                       elseif (extrNumber == 5) e = 'STFT';
                            elseif (extrNumber == 5)  continue;
                            end
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                            for classifNumber = 1 : 6
                                %%%%% JUST FOR OUTPUT PURPOSES %%%%%
                                if (classifNumber == 1) continue;
            %                             if (classifNumber == 1) c = 'Adaboost';
                                elseif (classifNumber == 2) c = 'LIBSVMFast';
            %                             elseif (classifNumber == 3) c = 'MLDA';
                                elseif (classifNumber == 3) continue;
            %                             elseif (classifNumber == 4) c = 'MLR';
                                elseif (classifNumber == 4) continue;
                                elseif (classifNumber == 5) c = 'NBayes';
            %                             elseif (classifNumber == 6) c = 'MLTREE';
                                elseif (classifNumber == 6) continue;
                                end
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                [meanAccuracy, time] = exampleMuseEmotiv(sess, dataset, channel, extrNumber, featSelectNumber, classifNumber, filter, device);
                                % Dumping to a FILE
                                % SUBJECT DATASET CLASSIFIER EXTRACTION_METHOD MEAN_ACCURACY

                                if meanAccuracy ~= 0
                                    nbytes = fprintf(fileID2,'%i,%s,%s,%s,%s,%f,%s\n', subject, flt, e, fS, c, meanAccuracy, time);

                                    sum = sum + meanAccuracy;
                                    count = count + 1;
                                end
                            end

                            %%%%% JUST FOR OUTPUT PURPOSES %%%%%
                            fprintf('\n');
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        end
                    end
                end
            end
            
            fclose(fileID2);            
            
            avg = sum / count;
            fprintf('\nAVERAGE: %f\n', avg);
        end
    end
end
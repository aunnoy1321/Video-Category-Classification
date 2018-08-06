function [meanAccuracies,time] = exampleMuseEmotiv(sess, dataset, channel, extrNumber, featSelectNumber, classifNumber, filter, device)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here

    % Load the data. Call this once outside of the script so you dont have to
    % load the data again and again. Make sure the dataset is included in your
    % Matlab path
    %Load a filter from the samples
    
    if (filter == 1  && device == 1) load filters/filt_IIREllipticNew;
    elseif (filter == 2 && device == 1) load filters/filt_IIRChebIshevI;
    elseif (filter == 3 && device == 1) load filters/filt_IIRChebIshevII;
    elseif (filter == 4 && device == 1) load filters/filt_FIREquirippleO256;
    elseif (filter == 5 && device == 1) load filters/filt_FIRLeastSquaresO256;
    
    elseif (filter == 1 && device == 2) load filters/IIR_Elliptic_Emo;
    elseif (filter == 2 && device == 2) load filters/IIR_ChebyShevI_Emo;
    elseif (filter == 3 && device == 2) load filters/IIR_ChebyShevII_Emo;
    elseif (filter == 4 && device == 2) load filters/FIR_Equiripple_O128_Emo;
    elseif (filter == 5 && device == 2) load filters/FIR_Least_Squares_O128_Emo;
    end

    refer = eegtoolkit.preprocessing.Rereferencing;
    %Subtract the mean from the signal
    refer.meanSignal = 1;

    ss = eegtoolkit.preprocessing.SampleSelection;

    
    ss.sampleRange = [1, size(sess.trials{1, 1}.signal, 2)];
    ss.channels = channel; % Specify the channel(s) to be used

    df = eegtoolkit.preprocessing.DigitalFilter; % Apply a filter to the raw data

    df.filt = Hbp; % Hbp is a filter built with "filterbuilder" matlab function



    %Extract features with the pwelch method
    if (extrNumber == 1) extr = eegtoolkit.featextraction.DWT;
    elseif (extrNumber == 2) extr = eegtoolkit.featextraction.FFT;
    elseif (extrNumber == 3) extr = eegtoolkit.featextraction.PWelch;%({}, 0, [1 3]);
    elseif (extrNumber == 4) extr = eegtoolkit.featextraction.PYAR;%({}, 0, [1 2]);
    elseif (extrNumber == 5) extr = eegtoolkit.featextraction.STFT;
    end
    
    
    %Feature Selection
    if (featSelectNumber == 1) featSelection = eegtoolkit.featselection.PCA;
    elseif (featSelectNumber == 2) featSelection = eegtoolkit.featselection.SVD;
    end

    %Configure the classifier
    if (classifNumber == 1) classif = eegtoolkit.classification.Adaboost;
    elseif (classifNumber == 2) classif = eegtoolkit.classification.LIBSVM;
    elseif (classifNumber == 3) classif = eegtoolkit.classification.MLDA;
    elseif (classifNumber == 4) classif = eegtoolkit.classification.MLR;
    elseif (classifNumber == 5) classif = eegtoolkit.classification.MLTboxMulticlass;
    elseif (classifNumber == 6) classif = eegtoolkit.classification.MLTREE;
    end

    %Set the Experimenter wrapper class
    experiment = eegtoolkit.experiment.Experimenter;
    experiment.session = sess;
    % Add the preprocessing steps (order is taken into account)
    experiment.preprocessing = {ss,refer,df};
    experiment.featextraction = extr;
    experiment.featselection = featSelection;
    experiment.classification = classif;
    experiment.evalMethod = experiment.EVAL_METHOD_LOSO; % specify that you want a "leave one subject out" (default is LOOCV)
    
        if (extrNumber == 1) e = 'DWT';
        elseif (extrNumber == 2) e = 'FFT';
        elseif (extrNumber == 3) e = 'PWelch';
        elseif (extrNumber == 4) e = 'PYAR';
        elseif (extrNumber == 5) e = 'STFT';
        end
        

        if (featSelectNumber == 1) fS = 'PCA';
        elseif (featSelectNumber == 2) fS = 'SVD';
        end
        
        if (classifNumber == 1) c = 'Adaboost';
        elseif (classifNumber == 2) c = 'LIBSVMFast';
        elseif (classifNumber == 3) c = 'MLDA';
        elseif (classifNumber == 4) c = 'MLR';
        elseif (classifNumber == 5) c = 'NBayes';
        elseif (classifNumber == 6) c = 'MLTREE';
        end
        
        if (filter == 1) flt = 'filt_IIRChebI';
        elseif (filter == 2) flt = 'filt_IIRElliptic';
        elseif (filter == 3) flt = 'epocfilter';
        elseif (filter == 4) flt = 'filt_IIRChebIshevI';
        elseif (filter == 5) flt = 'filt_IIRChebIshevII';
        elseif (filter == 6) flt = 'filt_IIREllipticNew';
        elseif (filter == 7) flt = 'filt_FIREquiripple';
        elseif (filter == 8) flt = 'filt_FIRLeastSquares';
        elseif (filter == 9) flt = 'filt_Notch';
        end
        
        experiment.run();
        for i=1:length(experiment.results)
            accuracies(i) = experiment.results{i}.getAccuracy();
        end

        meanAccuracies = mean(accuracies);
        
        % accuracies'
        %mean accuracy for all subjects
        fprintf('%s %s %s %s mean acc = %f\n', flt, e, fS, c, meanAccuracies);
        %get the configuration used (for reporting)
        time = experiment.getTime;
   
end
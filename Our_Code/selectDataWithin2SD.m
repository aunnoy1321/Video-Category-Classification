function newEEG = selectDataWithin2SD(eeg)
    sdArray = [];
    avgArray = [];
    lim = zeros(4, 2);
    
    for channel = 1:size(eeg, 2)
        sd = std(eeg(:, channel));
        avg = mean(eeg(:, channel));
        
        sdArray = [sdArray sd];
        avgArray = [avgArray avg];
        
        lowerLim = avg - 2 * sd;
        upperLim = avg + 2 * sd;
        
        lim(channel, 1) = lowerLim;
        lim(channel, 2) = upperLim;
    end
    
    newEEG = [];
    
    for i = 1:size(eeg, 1)
        flag = true;
        for j = 1:size(eeg, 2)
            if eeg(i, j) < lim(j, 1) || eeg(i, j) > lim(j, 2)
                flag = false;
                break;
            end
        end
        
        if (flag)
            newEEG = [newEEG; eeg(i, :)];
        end
    end
end
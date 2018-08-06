function [ windowSize ] = windowSizeCalculate( dataLength , percentage , split )

    windowSize = floor(dataLength / split) ;
    
    newPerc = floor(windowSize * percentage /100) ;
    
    oldPerc = 0;
    
    while (oldPerc ~= newPerc)
       dataLength =  dataLength + (newPerc - oldPerc) * (split - 1);
       
       windowSize = floor(dataLength / split); 
       
       oldPerc = newPerc;
       
       newPerc = floor(windowSize * percentage / 100); 
    end
end


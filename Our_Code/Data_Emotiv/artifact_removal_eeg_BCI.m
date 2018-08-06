function [sig_new D D_new] = artifact_removal_eeg_BCI(sig_us, Fs)

% load EEG_ref

%% Check data length compatibility
  data_length = 2^nextpow2 (length(sig_us));
    if (data_length > length(sig_us))
        data_length = 2^(nextpow2 (length(sig_us))-1);
    end
    sig_us = sig_us(1:data_length) - mean(sig_us(1:data_length));
    
%% HPF
% sig_us_hpf = highpass_filter(sig_us,Fs,30,1024);

%% Do Stationary wavelet decomposition/transform (SWT)

N = 5;
wave_name = 'haar' ; 

%%--SWT
 [A,D] = swt(sig_us,N,wave_name);
 
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wave_name);%% Remove Artifact Components

%% Initialization
length_seizure = length(D);
% seizure_sample = 0.1*randi([1, 10])*seizure_simulation(length_seizure,Fs);
% data_ref = EEG_ref(1,1:length(sig_us)); 
% seizure_norm = 5*seizure_sample/std(seizure_sample) + data_ref/std(data_ref);
% seizure_norm_bp = bandpass_filter(seizure_norm, Fs, 0.5, 30, 1024);
window_seizure = 1*Fs; 

num_seg = floor(length_seizure/window_seizure)-1;

%% Aprox Coef Thresholding
A_old = A(end,:); 
A_new = A_old;
% min_ratio = min((A_new))/(median(abs(A_new))/0.6745);
% max_ratio = max((A_new))/(median(abs(A_new))/0.6745);

avg_ratio_in = 3;

k1_in = 0.75;
D_new = D;


for j=1:num_seg

        A_segment = A_old(window_seizure*(j-1)+1:window_seizure*(j-1)+(window_seizure));
       
        
      avg_ratio = max(abs(A_segment))/std(A_segment);
      k1 = k1_in*avg_ratio/avg_ratio_in;
               
        sigma = median(abs(A_segment))/0.6745;
        T = k1*sqrt(2*log10(length(A_segment))*sigma^2);
        id = find((abs(A_segment)> T)==1);
        A_new(id+window_seizure*(j-1)) =     0;
%        A_new(id+window_seizure*(j)) =
%        T.^2./A_old(id+window_seizure*(j));     
        
   
       
%      
       
end


%% Detail Coef Thresholding

for k=1:N
    
     
    if(k==2 || k ==5 )
        k2 = 0.75;
    elseif(k==3  || k ==4) 
        k2 = 1;
    else
        k2 = 0.5;
    end

% k2 = 1;
    for j=1:num_seg
        D_segment = D(k, window_seizure*(j-1)+1:window_seizure*(j-1)+(window_seizure));
        sigma_sq = median(abs(D_segment))/0.6745;
        Th = k2*sqrt(2*log10(length(D_segment))*sigma_sq^2);
        idx = find((abs(D_segment)> Th)==1);
        D_new(k,idx+window_seizure*(j-1)) =     Th.^2./D(k,idx+window_seizure*(j-1));   % Garrote   
%     D_new(k,idx+window_seizure*(j)) = 0 ;
% D_new(k,idx) = Th.^2./D(k,idx);
    end
    
end
%% Reconstruction
sig_new = iswt(A_new, D_new, Lo_R, Hi_R);

sig_new = sig_new - mean(sig_new);


end
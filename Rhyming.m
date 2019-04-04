function timing_info_rhyming = Rhyming (w, Width, Height, subject_ID)

%define variables
% xlsread guarantees that first returned variable contains all numerical columns in sheet, etc, rather than how data is arranged on sheet (see docs)

[~,stimuli]=xlsread('reading_rhyming_stim.xlsx','Words'); %read column A
words= strtrim(stimuli);

num_words = length (words);
clear_mind_time = 4; 
number_stim_trial = 10; 
relax_time = 20;
trigger = 'rhyming';


if mod(num_words, number_stim_trial) ~= 0
    disp('==============================================')
    disp('ERROR Incorrect number of stimuli')
   disp('==============================================')
   return
end

Instructions(w,'Say a word that rhymes \n Press SPACE to continue');

% % shuffle words and rhyme status with the same ordering

reset(RandStream.getGlobalStream,sum(100*clock))
order = randperm(num_words);
words_random={};
for i = 1:num_words;
    words_random{i,1} = words{order(i),1};  
end

% % %empty arrays to read into with correct dimensions to avoid indexing errors
% Reaction_times=zeros(num_words,1);
% Correctness = zeros(num_words,1);

for i = 1:number_stim_trial:num_words;
    
[trial_length,length_clear_plus_active,length_clear_mind] = display_trial(w, words_random(i:i+9, :), relax_time, clear_mind_time,Width,Height,subject_ID,trigger);
timing_info_rhyming = [trial_length,length_clear_plus_active,length_clear_mind];
end


log_words (subject_ID,words_random,'rhyming');


end



function PracticeRhyming (w, Width, Height, subject_ID)

%define variables
% xlsread guarantees that first returned variable contains all numerical columns in sheet, etc, rather than how data is arranged on sheet (see docs)

[~,stimuli]=xlsread('reading_rhyming_stim.xlsx','Practice_Name'); %read column B
words= strtrim(stimuli);

num_words = length (words);
clear_mind_time = 3; 
number_stim_trial = 10;
relax_time = 5; 
trigger = 'none';

Instructions(w,'Try and CLEAR YOUR MIND when prompted \n Remember to imagine a scene during the RELAX period \n Press SPACE to continue');
Instructions(w,'You will see one word at a time \n Think of a word which rhymes with it and say it aloud \n Press SPACE to practice');

%
% % shuffle words and rhyme status with the same ordering

reset(RandStream.getGlobalStream,sum(100*clock))
order = randperm(num_words);
words_random={};
for i = 1:num_words;
    words_random{i,1} = words{order(i),1};  
end

for i = 1:number_stim_trial:num_words;
    
[trial_length,length_clear_plus_active,length_clear_mind] = display_trial(w, words_random(i:i+9, :), relax_time, clear_mind_time,Width,Height,subject_ID,trigger);

end

Instructions(w,'Well done \n Press SPACE to start the real thing');
log_words (subject_ID,words_random,'practice rhyming');

end



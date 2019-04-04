function [trial_length,length_clear_plus_active,length_clear_mind] = display_naming_trial_practice(w, words, relax_time, clear_mind_time,Width,Height)
%displays words one at a time in chunks for the desired numbers of words
%per trial

disp('Starting Display Trail');


Screen('TextFont',w,'Calibri');
Screen('TextSize',w,55)
Screen('TextStyle',w,0)
instructready='Clear Your Mind';
DrawFormattedText(w,instructready,'center','center',[255,255,255],[],[],[],3);
send_doppler_signal(1,subject_ID);
WaitSecs(0.25);
send_doppler_signal(0,subject_ID);

Screen(w,'Flip');

start_time = tic;



WaitSecs(clear_mind_time);

length_clear_mind = toc(start_time);

for j =1:length(words)
    
    Screen('Textsize',w,80);
    item=words{j,1};
    text = [item];
    DrawFormattedText(w,text,'center','center',[255,255,255],[],[],[],2);
    Screen(w,'Flip');
    WaitSecs(1.6);
end

length_clear_plus_active = toc(start_time);

Screen('TextSize',w,55);
instructrelax='Relax';
DrawFormattedText(w,instructrelax,'center','center',[255,255,255],[],[],[],2);
Screen(w,'Flip');
WaitSecs(relax_time);

trial_length = toc(start_time);
end
clear all
clc
close all

testing_script = input('Testing script? ');

%collect participant number, trial order, date and which keystrokes will be
%used. Trial Order and Keystroke condition are to allow for
%counterbalancing accross participants.

subject_ID{1}=input('Please enter Participant ID ','s');
subject_ID{2}=[];
while ~(strcmp(subject_ID{2},'A') || strcmp(subject_ID{2},'B'))
    subject_ID{2}= input('Which task first? A = reading B = rhyming ','s'); %Forces A or B input.
end
subject_ID{3} = date;
subject_ID{4} = testing_script;

% initialise toolbox and set screen size
[w,ScreenRect,Width,Height] =SetupToolBox(0.75,0) ;


%start trials in appropriate order

if subject_ID{2} == 'A';

PracticeReading(w, Width, Height, subject_ID)
timing_info_reading = Reading(w, Width, Height, subject_ID);

Instructions(w,'Well done! Press SPACE to continue to the second task');

PracticeRhyming(w, Width, Height, subject_ID)
timing_info_rhyming = Rhyming(w, Width, Height, subject_ID);

Instructions(w,'Task Over! Thanks for taking part!')
WaitSecs(2);
Screen('CloseAll');

%%%%%%%%%%%%%%%%%%%%%%

elseif subject_ID{2} == 'B';

PracticeRhyming(w, Width, Height, subject_ID)
timing_info_rhyming = Rhyming(w, Width, Height,subject_ID);

Instructions(w,'Well done! Press SPACE to continue to the second task');

PracticeReading(w, Width, Height, subject_ID)
timing_info_reading = Reading(w, Width, Height, subject_ID);

Instructions(w,'Task Over! Thanks for taking part!')
WaitSecs(2);
Screen('CloseAll');

end

ShowCursor;
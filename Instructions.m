function Instructions(screenpointer,message)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Screen('TextFont',screenpointer,'Calibri'); %set font for all instructions
Screen('TextSize',screenpointer,35);
Screen('TextStyle',screenpointer,0);

DrawFormattedText(screenpointer, message, 'center', 'center', [255 255 255],[],[],[],6); %Choose Text
Screen(screenpointer, 'Flip'); %Flip to Monitor

KbWait;
WaitSecs(1);    %Wait for KeyPress

Screen('PutImage', screenpointer, 128); % clear screen
Screen('Flip',screenpointer); % now visible on screen
WaitSecs(0.3);

end


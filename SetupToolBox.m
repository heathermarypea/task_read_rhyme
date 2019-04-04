function [Window, ScreenSize,Width,Height] = SetupToolBox(develop,Mon)
%Sets up the Psychtoolbox
%Window - Returns Window pointer  
%ScreenSize - Screenbounding box
%develop   - controls size of PTB window if == 1 then full screen for PTB display
%Mon - Monitor 0 for default
%Offst ~ Offset for PTB window when under development

if develop < 0.9, %Just see if we can offset the PTB from the top left corner for most Screen sizes
    Offst=50;
else
    Offst=0;
end

 Rect=Screen('Rect', Mon); %Grabs Screen dimensions
 KbName('UnifyKeyNames'); %Used To Unify keyboard keys across computers
 Screen('Preference', 'SuppressAllWarnings', 1); %As it says!
 Screen('Preference', 'SkipSyncTests', 1); %Skip sync test to avoid crashes during development
 
 if develop==1,  %Check to see if full or partial display is required
     [Window, ScreenSize] =Screen('OpenWindow',Mon, [0,0,0],[]); % open PTB  full screen
 else
     [Window, ScreenSize] =Screen('OpenWindow',Mon, [0,0,0],Rect*develop+Offst); % open PTB
 end
 
 Width = ScreenSize(3)-ScreenSize(1); %Width of PTB
 Height = ScreenSize(4)-ScreenSize(2); %Height  of PTB
HideCursor;
end


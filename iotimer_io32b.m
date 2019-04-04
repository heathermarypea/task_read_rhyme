%iotimer_io32b.m
%
%calculate average response latency for 1,000 successive
%reads from the LPT1: Status port using the io32 mex-file object

clear all
start_cogent;

%create IO32 object
ioObj = io32;
%initialize inpout32.dll device driver
if ( io32(ioObj) == 0 )
    disp(' ');
    disp('inpout32.dll successfully installed.')
else
    disp('inpout32.dll installation failed.')
    return
end
%read the LPT1 status port using io32(ioObj,address)
status = hex2dec('379');  %LPT1 Status port addr
x=io32(ioObj,status);
    
tstart=time;
tstart=time; %overhead free time reading

disp('Collecting data from 1,000 consecutive LPT1 Status port reads')
tstart=time;
for i=1:1000
    x=io32(ioObj,status);
end
tend=time;

elapsed=tend-tstart;
disp('BENCHMARK RESULTS FOR IOReadWrite I/O TEST');
disp(['Total elapsed time = ',num2str(elapsed),' msec'])
disp(['Mean latency = ',num2str(elapsed./1000),' msec'])

stop_cogent;
clear all;

function send_doppler_signal(value,subject_ID)

while subject_ID{4} == 0;
    %create an instance of the io32 object
    ioObj = io32;
    %
    %initialize the hwinterface.sys kernel-level I/O driver
    status = io32(ioObj);
    %
    %if status = 0, you are now ready to write and read to a hardware port
    %let's try sending the value=1 to the parallel printer's output port (LPT1)
    address = hex2dec('378');          %standard LPT1 output port address (0x378)
    data_out=value;                                 %sample data value
    io32(ioObj,address,data_out);   %output command
    %
    %now, let's read that value back into MATLAB
    data_in=io32(ioObj,address);
    %when finished with the io32 object it can be discarded via
    %'clear all', 'clear mex', 'clear io32' or 'clear functions' command.
end

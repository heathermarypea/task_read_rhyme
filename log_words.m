function log_words(subject_data, Words, condition)

subject_name=subject_data{1}; %Grab subject's ID number
datafile=sprintf('results.xlsx'); %Open stimuli file
tab_name=strcat(subject_name,condition);
column_headings={'Word'}; %Organize & Label Excel sheet
    
xlswrite(datafile,subject_data,tab_name,'A1'); %Write to Excel file

xlswrite(datafile,column_headings,tab_name,'A3'); %Write to Excel file
xlswrite(datafile,Words,tab_name, 'A4');

end
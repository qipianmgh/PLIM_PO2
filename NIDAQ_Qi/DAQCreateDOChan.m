function status = DAQCreateDOChan(taskHandle, lines)
status = DAQmxCreateDOChan(taskHandle,lines, ' ', DAQmx_Val_ChanPerLine);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
end





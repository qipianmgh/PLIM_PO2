function status = DAQConnectTerms(sourceTerminal, destinationTerminal)
status = DAQmxConnectTerms(sourceTerminal,destinationTerminal,DAQmx_Val_DoNotInvertPolarity);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
end




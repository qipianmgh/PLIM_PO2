function status = DAQSetBufInputBufSize(taskHandle, data)
status = DAQmxSetBufInputBufSize(taskHandle, uint32(data));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
end



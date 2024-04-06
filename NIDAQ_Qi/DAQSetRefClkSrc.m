function status = DAQSetRefClkSrc(taskHandle, data)
[status, data] = DAQmxSetRefClkSrc(taskHandle, data);
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
    errorString = DAQGetExtendedErrorInfo();
    error(errorString);
end
end 




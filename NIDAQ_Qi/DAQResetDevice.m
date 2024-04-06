function status = DAQResetDevice(deviceName)
status = daq.ni.NIDAQmx.DAQmxResetDevice(deviceName);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
end

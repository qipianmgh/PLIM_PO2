function status = DAQWriteDigitalLines(taskHandle, writeArray)
[status, sampsPerChanWritten, reserved] = DAQmxWriteDigitalLines (taskHandle, int32(1), uint32(1), double(-1), uint32(DAQmx_Val_GroupByChannel), uint8(writeArray), int32(1),uint32(0));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
end





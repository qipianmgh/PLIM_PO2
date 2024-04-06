function status = DAQWriteAnalogF64(taskHandle, numSampsPerChan, autoStart, writeArray)
[status, sampsPerChanWritten, reserved] = DAQmxWriteAnalogF64(taskHandle,int32(numSampsPerChan),uint32(autoStart),-1,uint32(DAQmx_Val_GroupByScanNumber),writeArray,int32(0),uint32(0));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end

%     narginchk(8, 8);
%     nargoutchk(3, 3);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteAnalogF64', 'taskHandle', 1);
%     validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteAnalogF64', 'numSampsPerChan', 2);
%     validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteAnalogF64', 'autoStart', 3);
%     validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteAnalogF64', 'timeout', 4);
%     validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteAnalogF64', 'dataLayout', 5);
%     validateattributes(writeArray, {'double'}, {'vector'}, 'DAQmxWriteAnalogF64', 'writeArray', 6);
%     validateattributes(sampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteAnalogF64', 'sampsPerChanWritten', 7);
%     validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteAnalogF64', 'reserved', 8);
%     [status, sampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteAnalogF64', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved);
end


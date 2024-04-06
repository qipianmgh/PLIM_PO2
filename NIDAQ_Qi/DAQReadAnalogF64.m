function readArray = DAQReadAnalogF64(taskHandle, numSampsPerChan, readArray)
[status, readArray, sampsPerChanRead, AI_reserved] = DAQmxReadAnalogF64(taskHandle,int32(numSampsPerChan),double(-1),uint32(DAQmx_Val_GroupByScanNumber),double(readArray),uint32(size(readArray,1)),int32(numSampsPerChan),uint32(0));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end

%     narginchk(8, 8);
%     nargoutchk(4, 4);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadAnalogF64', 'taskHandle', 1);
%     validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadAnalogF64', 'numSampsPerChan', 2);
%     validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadAnalogF64', 'timeout', 3);
%     validateattributes(fillMode, {'uint32'}, {'scalar'}, 'DAQmxReadAnalogF64', 'fillMode', 4);
%     validateattributes(readArray, {'double'}, {'vector'}, 'DAQmxReadAnalogF64', 'readArray', 5);
%     validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadAnalogF64', 'arraySizeInSamps', 6);
%     validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadAnalogF64', 'sampsPerChanRead', 7);
%     validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadAnalogF64', 'reserved', 8);
%     [status, readArray, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadAnalogF64', taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved);
end    


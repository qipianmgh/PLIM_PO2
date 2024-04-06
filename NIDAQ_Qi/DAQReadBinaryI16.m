function readArray = DAQReadBinaryI16(taskHandle, numSampsPerChan, readArray)
[status, readArray, sampsPerChanRead, AI_reserved] = DAQmxReadBinaryI16(taskHandle, int32(numSampsPerChan), double(-1), uint32(DAQmx_Val_GroupByScanNumber), int16(readArray), uint32(size(readArray,1)),int32(numSampsPerChan),uint32(0));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end

%     narginchk(8, 8);
%     nargoutchk(4, 4);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadBinaryI16', 'taskHandle', 1);
%     validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadBinaryI16', 'numSampsPerChan', 2);
%     validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadBinaryI16', 'timeout', 3);
%     validateattributes(fillMode, {'uint32'}, {'scalar'}, 'DAQmxReadBinaryI16', 'fillMode', 4);
%     validateattributes(readArray, {'int16'}, {'vector'}, 'DAQmxReadBinaryI16', 'readArray', 5);
%     validateattributes(arraySizeInSamps, {'uint32'}, {'scalar'}, 'DAQmxReadBinaryI16', 'arraySizeInSamps', 6);
%     validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadBinaryI16', 'sampsPerChanRead', 7);
%     validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadBinaryI16', 'reserved', 8);
%     [status, readArray, sampsPerChanRead, reserved]= mexNIDAQmx('DAQmxReadBinaryI16', taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved);
end

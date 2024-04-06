function readArray = DAQReadDigitalLines(taskHandle)
[status, readArray, sampsPerChanRead, numBytesPerSamp, reserved] = DAQmxReadDigitalLines (taskHandle, int32(1), double(-1), uint32(DAQmx_Val_GroupByChannel), uint8(0), uint32(1),int32(1),int32(1),uint32(0));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end

%     narginchk(9, 9);
%     nargoutchk(5, 5);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxReadDigitalLines', 'taskHandle', 1);
%     validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxReadDigitalLines', 'numSampsPerChan', 2);
%     validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxReadDigitalLines', 'timeout', 3);
%     validateattributes(fillMode, {'uint32'}, {'scalar'}, 'DAQmxReadDigitalLines', 'fillMode', 4);
%     validateattributes(readArray, {'uint8'}, {'vector'}, 'DAQmxReadDigitalLines', 'readArray', 5);
%     validateattributes(arraySizeInBytes, {'uint32'}, {'scalar'}, 'DAQmxReadDigitalLines', 'arraySizeInBytes', 6);
%     validateattributes(sampsPerChanRead, {'int32'}, {'vector'}, 'DAQmxReadDigitalLines', 'sampsPerChanRead', 7);
%     validateattributes(numBytesPerSamp, {'int32'}, {'vector'}, 'DAQmxReadDigitalLines', 'numBytesPerSamp', 8);
%     validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxReadDigitalLines', 'reserved', 9);
%     [status, readArray, sampsPerChanRead, numBytesPerSamp, reserved]= mexNIDAQmx('DAQmxReadDigitalLines', taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInBytes, sampsPerChanRead, numBytesPerSamp, reserved);
end




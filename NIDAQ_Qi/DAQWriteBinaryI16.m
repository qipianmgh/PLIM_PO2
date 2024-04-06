% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQWriteBinaryI16(taskHandle, numSampsPerChan, autoStart, writeArray)
[status, sampsPerChanWritten, reserved] = DAQmxWriteBinaryI16(taskHandle, int32(numSampsPerChan), uint32(autoStart), -1, uint32(DAQmx_Val_GroupByScanNumber), writeArray, int32([0]), uint32(0));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     function [status, sampsPerChanWritten, reserved] = DAQmxWriteBinaryI16(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
%     narginchk(8, 8);
%     nargoutchk(3, 3);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteBinaryI16', 'taskHandle', 1);
%     validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteBinaryI16', 'numSampsPerChan', 2);
%     validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteBinaryI16', 'autoStart', 3);
%     validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteBinaryI16', 'timeout', 4);
%     validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteBinaryI16', 'dataLayout', 5);
%     validateattributes(writeArray, {'int16'}, {'vector'}, 'DAQmxWriteBinaryI16', 'writeArray', 6);
%     validateattributes(sampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteBinaryI16', 'sampsPerChanWritten', 7);
%     validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteBinaryI16', 'reserved', 8);
%     [status, sampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteBinaryI16', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved);
end

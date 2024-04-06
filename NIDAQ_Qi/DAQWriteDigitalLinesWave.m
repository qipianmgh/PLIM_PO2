function status = DAQWriteDigitalLinesWave(taskHandle, numSampsPerChan, autoStart, writeArray)
[status, sampsPerChanWritten, reserved] = DAQmxWriteDigitalLines (taskHandle, int32(numSampsPerChan), uint32(autoStart), double(-1), uint32(DAQmx_Val_GroupByScanNumber), uint8(writeArray), int32([0]),uint32(0));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
% function [status, sampsPerChanWritten, reserved] = DAQmxWriteDigitalLines(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
%     narginchk(8, 8);
%     nargoutchk(3, 3);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWriteDigitalLines', 'taskHandle', 1);
%     validateattributes(numSampsPerChan, {'int32'}, {'scalar'}, 'DAQmxWriteDigitalLines', 'numSampsPerChan', 2);
%     validateattributes(autoStart, {'uint32'}, {'scalar'}, 'DAQmxWriteDigitalLines', 'autoStart', 3);
%     validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWriteDigitalLines', 'timeout', 4);
%     validateattributes(dataLayout, {'uint32'}, {'scalar'}, 'DAQmxWriteDigitalLines', 'dataLayout', 5);
%     validateattributes(writeArray, {'uint8'}, {'vector'}, 'DAQmxWriteDigitalLines', 'writeArray', 6);
%     validateattributes(sampsPerChanWritten, {'int32'}, {'vector'}, 'DAQmxWriteDigitalLines', 'sampsPerChanWritten', 7);
%     validateattributes(reserved, {'uint32'}, {'vector'}, 'DAQmxWriteDigitalLines', 'reserved', 8);
%     [status, sampsPerChanWritten, reserved]= mexNIDAQmx('DAQmxWriteDigitalLines', taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved);
% end
end





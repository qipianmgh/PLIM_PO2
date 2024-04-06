% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQExportSignal(taskHandle, signalID, outputTerminal)
status = DAQmxExportSignal(taskHandle, int32(signalID), outputTerminal);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxExportSignal', 'taskHandle', 1);
%     validateattributes(signalID, {'int32'}, {'scalar'}, 'DAQmxExportSignal', 'signalID', 2);
%     validateattributes(outputTerminal, {'char'}, {'vector'}, 'DAQmxExportSignal', 'outputTerminal', 3);
%     [status]= mexNIDAQmx('DAQmxExportSignal', taskHandle, signalID, outputTerminal);
end

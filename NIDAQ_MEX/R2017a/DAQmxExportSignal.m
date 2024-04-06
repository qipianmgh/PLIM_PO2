% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxExportSignal(taskHandle, signalID, outputTerminal)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxExportSignal', 'taskHandle', 1);
    validateattributes(signalID, {'int32'}, {'scalar'}, 'DAQmxExportSignal', 'signalID', 2);
    validateattributes(outputTerminal, {'char'}, {'vector'}, 'DAQmxExportSignal', 'outputTerminal', 3);
    [status]= mexNIDAQmx('DAQmxExportSignal', taskHandle, signalID, outputTerminal);
end

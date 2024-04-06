% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedWatchdogExpiredEventOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedWatchdogExpiredEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExportedWatchdogExpiredEventOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExportedWatchdogExpiredEventOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExportedWatchdogExpiredEventOutputTerm', taskHandle, data, bufferSize);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeWatchdogExpirTrigSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeWatchdogExpirTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigEdgeWatchdogExpirTrigSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigEdgeWatchdogExpirTrigSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeWatchdogExpirTrigSrc', taskHandle, data, bufferSize);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigEdgeWatchdogExpirTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeWatchdogExpirTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigEdgeWatchdogExpirTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigEdgeWatchdogExpirTrigSrc', taskHandle, data);
end

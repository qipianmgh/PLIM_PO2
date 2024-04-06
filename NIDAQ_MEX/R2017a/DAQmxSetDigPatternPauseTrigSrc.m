% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigPatternPauseTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigPatternPauseTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigPatternPauseTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigPatternPauseTrigSrc', taskHandle, data);
end

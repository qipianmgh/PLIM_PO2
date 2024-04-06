% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigPatternPauseTrigPattern(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigPatternPauseTrigPattern', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigPatternPauseTrigPattern', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigPatternPauseTrigPattern', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigPatternPauseTrigPattern', taskHandle, data, bufferSize);
end

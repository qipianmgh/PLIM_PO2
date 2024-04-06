% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigPatternStartTrigPattern(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigPatternStartTrigPattern', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigPatternStartTrigPattern', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigPatternStartTrigPattern', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigPatternStartTrigPattern', taskHandle, data, bufferSize);
end

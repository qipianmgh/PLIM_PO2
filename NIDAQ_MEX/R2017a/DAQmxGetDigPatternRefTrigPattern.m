% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigPatternRefTrigPattern(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigPatternRefTrigPattern', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigPatternRefTrigPattern', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigPatternRefTrigPattern', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigPatternRefTrigPattern', taskHandle, data, bufferSize);
end

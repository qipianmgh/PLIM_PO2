% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigPatternStartTrigSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigPatternStartTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigPatternStartTrigSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigPatternStartTrigSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigPatternStartTrigSrc', taskHandle, data, bufferSize);
end

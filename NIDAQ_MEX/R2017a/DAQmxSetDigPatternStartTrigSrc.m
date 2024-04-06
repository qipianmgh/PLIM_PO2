% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigPatternStartTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigPatternStartTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigPatternStartTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigPatternStartTrigSrc', taskHandle, data);
end

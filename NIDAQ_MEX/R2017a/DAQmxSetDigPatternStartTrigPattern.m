% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigPatternStartTrigPattern(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigPatternStartTrigPattern', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigPatternStartTrigPattern', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigPatternStartTrigPattern', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigPatternRefTrigPattern(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigPatternRefTrigPattern', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigPatternRefTrigPattern', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigPatternRefTrigPattern', taskHandle, data);
end

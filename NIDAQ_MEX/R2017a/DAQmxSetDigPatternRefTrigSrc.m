% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigPatternRefTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigPatternRefTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigPatternRefTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigPatternRefTrigSrc', taskHandle, data);
end

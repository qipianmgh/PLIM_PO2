% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRefTrigDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRefTrigDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetRefTrigDelay', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetRefTrigDelay', taskHandle, data);
end

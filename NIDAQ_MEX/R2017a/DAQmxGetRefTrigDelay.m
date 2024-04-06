% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRefTrigDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRefTrigDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetRefTrigDelay', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRefTrigDelay', taskHandle, data);
end

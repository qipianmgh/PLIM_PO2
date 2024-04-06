% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetStartTrigDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetStartTrigDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetStartTrigDelay', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetStartTrigDelay', taskHandle, data);
end

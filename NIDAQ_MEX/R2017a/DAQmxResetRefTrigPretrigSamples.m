% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetRefTrigPretrigSamples(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetRefTrigPretrigSamples', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetRefTrigPretrigSamples', taskHandle);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetHshkDelayAfterXfer(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetHshkDelayAfterXfer', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetHshkDelayAfterXfer', taskHandle);
end

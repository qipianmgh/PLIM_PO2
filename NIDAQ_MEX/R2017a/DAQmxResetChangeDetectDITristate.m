% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetChangeDetectDITristate(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetChangeDetectDITristate', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetChangeDetectDITristate', taskHandle);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetChangeDetectDITristate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetChangeDetectDITristate', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetChangeDetectDITristate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetChangeDetectDITristate', taskHandle, data);
end

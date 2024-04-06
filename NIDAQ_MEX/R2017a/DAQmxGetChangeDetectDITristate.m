% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetChangeDetectDITristate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetChangeDetectDITristate', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetChangeDetectDITristate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetChangeDetectDITristate', taskHandle, data);
end

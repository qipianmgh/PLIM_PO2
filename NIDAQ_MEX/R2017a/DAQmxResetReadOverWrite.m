% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetReadOverWrite(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetReadOverWrite', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetReadOverWrite', taskHandle);
end

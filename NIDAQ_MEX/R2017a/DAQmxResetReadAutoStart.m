% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetReadAutoStart(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetReadAutoStart', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetReadAutoStart', taskHandle);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetReadRelativeTo(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetReadRelativeTo', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetReadRelativeTo', taskHandle);
end

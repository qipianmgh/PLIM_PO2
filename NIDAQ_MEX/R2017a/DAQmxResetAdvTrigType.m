% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAdvTrigType(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAdvTrigType', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAdvTrigType', taskHandle);
end

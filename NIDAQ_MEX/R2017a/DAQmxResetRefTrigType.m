% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetRefTrigType(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetRefTrigType', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetRefTrigType', taskHandle);
end

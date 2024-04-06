% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetHshkTrigType(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetHshkTrigType', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetHshkTrigType', taskHandle);
end

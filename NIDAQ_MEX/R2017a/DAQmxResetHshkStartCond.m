% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetHshkStartCond(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetHshkStartCond', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetHshkStartCond', taskHandle);
end

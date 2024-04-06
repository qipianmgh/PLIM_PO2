% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampQuantSampPerChan(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampQuantSampPerChan', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampQuantSampPerChan', taskHandle);
end

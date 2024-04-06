% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampQuantSampMode(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampQuantSampMode', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampQuantSampMode', taskHandle);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkTimebaseSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkTimebaseSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkTimebaseSrc', taskHandle);
end

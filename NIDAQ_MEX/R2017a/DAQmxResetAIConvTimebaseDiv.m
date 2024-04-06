% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvTimebaseDiv(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvTimebaseDiv', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAIConvTimebaseDiv', taskHandle);
end

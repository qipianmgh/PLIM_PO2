% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvRateEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvRateEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvRateEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvRateEx', taskHandle, deviceNames);
end

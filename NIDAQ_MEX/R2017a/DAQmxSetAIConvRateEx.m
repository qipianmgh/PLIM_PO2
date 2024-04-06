% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvRateEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvRateEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvRateEx', 'deviceNames', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIConvRateEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIConvRateEx', taskHandle, deviceNames, data);
end

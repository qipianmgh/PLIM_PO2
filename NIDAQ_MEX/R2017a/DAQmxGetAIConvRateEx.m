% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvRateEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvRateEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvRateEx', 'deviceNames', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIConvRateEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvRateEx', taskHandle, deviceNames, data);
end

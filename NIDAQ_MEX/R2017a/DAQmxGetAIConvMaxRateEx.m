% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvMaxRateEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvMaxRateEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvMaxRateEx', 'deviceNames', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIConvMaxRateEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvMaxRateEx', taskHandle, deviceNames, data);
end

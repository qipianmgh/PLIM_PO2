% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvDigFltrMinPulseWidthEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvDigFltrMinPulseWidthEx', 'deviceNames', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIConvDigFltrMinPulseWidthEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvDigFltrMinPulseWidthEx', taskHandle, deviceNames, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvDigFltrTimebaseRateEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvDigFltrTimebaseRateEx', 'deviceNames', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIConvDigFltrTimebaseRateEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvDigFltrTimebaseRateEx', taskHandle, deviceNames, data);
end

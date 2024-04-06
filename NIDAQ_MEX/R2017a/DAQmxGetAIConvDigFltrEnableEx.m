% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvDigFltrEnableEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvDigFltrEnableEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvDigFltrEnableEx', 'deviceNames', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIConvDigFltrEnableEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvDigFltrEnableEx', taskHandle, deviceNames, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvDigFltrEnableEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvDigFltrEnableEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvDigFltrEnableEx', 'deviceNames', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIConvDigFltrEnableEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIConvDigFltrEnableEx', taskHandle, deviceNames, data);
end

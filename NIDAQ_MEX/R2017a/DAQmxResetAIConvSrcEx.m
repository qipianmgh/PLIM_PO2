% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvSrcEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvSrcEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvSrcEx', taskHandle, deviceNames);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvActiveEdgeEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvActiveEdgeEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvActiveEdgeEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvActiveEdgeEx', taskHandle, deviceNames);
end

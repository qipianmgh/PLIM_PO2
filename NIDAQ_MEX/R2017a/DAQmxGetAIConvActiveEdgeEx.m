% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvActiveEdgeEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvActiveEdgeEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvActiveEdgeEx', 'deviceNames', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIConvActiveEdgeEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvActiveEdgeEx', taskHandle, deviceNames, data);
end

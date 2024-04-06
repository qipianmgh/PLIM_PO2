% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIConvSrcEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvSrcEx', 'deviceNames', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAIConvSrcEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAIConvSrcEx', taskHandle, deviceNames, data);
end

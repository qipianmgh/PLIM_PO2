% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvTimebaseSrcEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvTimebaseSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvTimebaseSrcEx', 'deviceNames', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIConvTimebaseSrcEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvTimebaseSrcEx', taskHandle, deviceNames, data);
end

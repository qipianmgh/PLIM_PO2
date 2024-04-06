% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvTimebaseSrcEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvTimebaseSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvTimebaseSrcEx', 'deviceNames', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIConvTimebaseSrcEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIConvTimebaseSrcEx', taskHandle, deviceNames, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvTimebaseSrcEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvTimebaseSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvTimebaseSrcEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvTimebaseSrcEx', taskHandle, deviceNames);
end

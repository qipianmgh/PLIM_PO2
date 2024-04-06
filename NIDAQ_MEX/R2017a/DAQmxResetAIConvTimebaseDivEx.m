% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvTimebaseDivEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvTimebaseDivEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvTimebaseDivEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvTimebaseDivEx', taskHandle, deviceNames);
end

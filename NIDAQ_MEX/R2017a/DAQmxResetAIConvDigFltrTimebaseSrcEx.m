% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvDigFltrTimebaseSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvDigFltrTimebaseSrcEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvDigFltrTimebaseSrcEx', taskHandle, deviceNames);
end

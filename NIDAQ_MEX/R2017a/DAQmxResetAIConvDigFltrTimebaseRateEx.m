% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvDigFltrTimebaseRateEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvDigFltrTimebaseRateEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvDigFltrTimebaseRateEx', taskHandle, deviceNames);
end

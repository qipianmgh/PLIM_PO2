% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvDigFltrMinPulseWidthEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxResetAIConvDigFltrMinPulseWidthEx', 'deviceNames', 2);
    [status]= mexNIDAQmx('DAQmxResetAIConvDigFltrMinPulseWidthEx', taskHandle, deviceNames);
end

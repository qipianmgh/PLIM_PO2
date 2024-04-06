% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvDigFltrMinPulseWidthEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvDigFltrMinPulseWidthEx', 'deviceNames', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIConvDigFltrMinPulseWidthEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIConvDigFltrMinPulseWidthEx', taskHandle, deviceNames, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvDigFltrTimebaseRateEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvDigFltrTimebaseRateEx', 'deviceNames', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIConvDigFltrTimebaseRateEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIConvDigFltrTimebaseRateEx', taskHandle, deviceNames, data);
end

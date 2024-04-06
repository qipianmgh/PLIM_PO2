% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDIDigFltrMinPulseWidth', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIDigFltrMinPulseWidth', taskHandle, channel, data);
end

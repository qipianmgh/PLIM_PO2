% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDIDigFltrMinPulseWidth', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIDigFltrMinPulseWidth', taskHandle, channel, data);
end

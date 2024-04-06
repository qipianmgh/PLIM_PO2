% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseHighTime(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseHighTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseHighTime', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOPulseHighTime', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseHighTime', taskHandle, channel, data);
end

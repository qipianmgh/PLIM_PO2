% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCITimestampInitialSeconds(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITimestampInitialSeconds', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITimestampInitialSeconds', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCITimestampInitialSeconds', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCITimestampInitialSeconds', taskHandle, channel, data);
end

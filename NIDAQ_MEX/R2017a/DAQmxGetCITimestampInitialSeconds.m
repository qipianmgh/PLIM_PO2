% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCITimestampInitialSeconds(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCITimestampInitialSeconds', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCITimestampInitialSeconds', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCITimestampInitialSeconds', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCITimestampInitialSeconds', taskHandle, channel, data);
end

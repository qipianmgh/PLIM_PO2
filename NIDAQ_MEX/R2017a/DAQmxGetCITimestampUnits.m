% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCITimestampUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCITimestampUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCITimestampUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCITimestampUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCITimestampUnits', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCITimestampUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITimestampUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITimestampUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCITimestampUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCITimestampUnits', taskHandle, channel, data);
end

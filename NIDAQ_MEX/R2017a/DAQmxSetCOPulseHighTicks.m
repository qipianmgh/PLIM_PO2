% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseHighTicks(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseHighTicks', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseHighTicks', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOPulseHighTicks', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseHighTicks', taskHandle, channel, data);
end

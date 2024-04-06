% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOPulseHighTicks(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOPulseHighTicks', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOPulseHighTicks', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOPulseHighTicks', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOPulseHighTicks', taskHandle, channel, data);
end

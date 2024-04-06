% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseTicksInitialDelay(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseTicksInitialDelay', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseTicksInitialDelay', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOPulseTicksInitialDelay', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseTicksInitialDelay', taskHandle, channel, data);
end

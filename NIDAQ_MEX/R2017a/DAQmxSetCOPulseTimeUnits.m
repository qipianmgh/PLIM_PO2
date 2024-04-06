% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseTimeUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseTimeUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseTimeUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCOPulseTimeUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseTimeUnits', taskHandle, channel, data);
end

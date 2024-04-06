% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAISoundPressureUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAISoundPressureUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAISoundPressureUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAISoundPressureUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAISoundPressureUnits', taskHandle, channel, data);
end

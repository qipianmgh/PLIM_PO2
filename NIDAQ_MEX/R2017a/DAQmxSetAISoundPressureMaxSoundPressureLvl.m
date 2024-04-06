% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAISoundPressureMaxSoundPressureLvl(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAISoundPressureMaxSoundPressureLvl', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAISoundPressureMaxSoundPressureLvl', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAISoundPressureMaxSoundPressureLvl', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAISoundPressureMaxSoundPressureLvl', taskHandle, channel, data);
end

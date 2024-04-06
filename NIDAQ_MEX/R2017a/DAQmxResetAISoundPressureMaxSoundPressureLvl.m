% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAISoundPressureMaxSoundPressureLvl(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAISoundPressureMaxSoundPressureLvl', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAISoundPressureMaxSoundPressureLvl', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAISoundPressureMaxSoundPressureLvl', taskHandle, channel);
end

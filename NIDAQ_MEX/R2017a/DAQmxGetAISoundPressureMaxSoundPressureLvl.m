% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAISoundPressureMaxSoundPressureLvl(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAISoundPressureMaxSoundPressureLvl', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAISoundPressureMaxSoundPressureLvl', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAISoundPressureMaxSoundPressureLvl', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAISoundPressureMaxSoundPressureLvl', taskHandle, channel, data);
end

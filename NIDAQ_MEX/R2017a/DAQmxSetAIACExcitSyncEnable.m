% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIACExcitSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIACExcitSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIACExcitSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIACExcitSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIACExcitSyncEnable', taskHandle, channel, data);
end

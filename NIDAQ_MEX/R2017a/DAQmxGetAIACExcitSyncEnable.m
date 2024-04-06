% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIACExcitSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIACExcitSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIACExcitSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIACExcitSyncEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIACExcitSyncEnable', taskHandle, channel, data);
end

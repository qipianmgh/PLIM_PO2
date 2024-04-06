% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCISemiPeriodDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCISemiPeriodDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCISemiPeriodDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCISemiPeriodDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCISemiPeriodDigSyncEnable', taskHandle, channel, data);
end

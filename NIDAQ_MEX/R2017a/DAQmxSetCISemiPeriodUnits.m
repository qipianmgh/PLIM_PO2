% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCISemiPeriodUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCISemiPeriodUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCISemiPeriodUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCISemiPeriodUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCISemiPeriodUnits', taskHandle, channel, data);
end

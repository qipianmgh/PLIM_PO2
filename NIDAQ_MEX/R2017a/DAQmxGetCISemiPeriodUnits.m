% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCISemiPeriodUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCISemiPeriodUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCISemiPeriodUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCISemiPeriodUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCISemiPeriodUnits', taskHandle, channel, data);
end

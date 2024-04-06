% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPeriodMeasTime(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPeriodMeasTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPeriodMeasTime', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIPeriodMeasTime', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPeriodMeasTime', taskHandle, channel, data);
end

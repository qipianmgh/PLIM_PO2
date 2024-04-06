% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPeriodMeasTime(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPeriodMeasTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPeriodMeasTime', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIPeriodMeasTime', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPeriodMeasTime', taskHandle, channel, data);
end

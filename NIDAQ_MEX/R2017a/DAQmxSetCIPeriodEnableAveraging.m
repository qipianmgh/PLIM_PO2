% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPeriodEnableAveraging(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPeriodEnableAveraging', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPeriodEnableAveraging', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIPeriodEnableAveraging', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPeriodEnableAveraging', taskHandle, channel, data);
end

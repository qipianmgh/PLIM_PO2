% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalApplyCalIfExp(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalApplyCalIfExp', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalApplyCalIfExp', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIChanCalApplyCalIfExp', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalApplyCalIfExp', taskHandle, channel, data);
end

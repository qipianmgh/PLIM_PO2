% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIChanCalApplyCalIfExp(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalApplyCalIfExp', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalApplyCalIfExp', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalApplyCalIfExp', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIChanCalApplyCalIfExp', taskHandle, channel, data);
end

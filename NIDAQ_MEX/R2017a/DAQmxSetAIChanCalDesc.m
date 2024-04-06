% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIChanCalDesc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalDesc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalDesc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAIChanCalDesc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAIChanCalDesc', taskHandle, channel, data);
end

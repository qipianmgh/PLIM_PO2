% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIChanCalOperatorName(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalOperatorName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalOperatorName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAIChanCalOperatorName', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAIChanCalOperatorName', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIChanCalEnableCal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalEnableCal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalEnableCal', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalEnableCal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIChanCalEnableCal', taskHandle, channel, data);
end

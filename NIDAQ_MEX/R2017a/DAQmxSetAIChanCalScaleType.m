% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIChanCalScaleType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalScaleType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalScaleType', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIChanCalScaleType', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIChanCalScaleType', taskHandle, channel, data);
end

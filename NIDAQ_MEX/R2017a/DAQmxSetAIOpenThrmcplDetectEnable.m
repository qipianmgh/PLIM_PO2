% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIOpenThrmcplDetectEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIOpenThrmcplDetectEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIOpenThrmcplDetectEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIOpenThrmcplDetectEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIOpenThrmcplDetectEnable', taskHandle, channel, data);
end

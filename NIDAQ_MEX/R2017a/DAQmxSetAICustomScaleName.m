% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAICustomScaleName(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAICustomScaleName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAICustomScaleName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAICustomScaleName', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAICustomScaleName', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCICustomScaleName(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICustomScaleName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICustomScaleName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCICustomScaleName', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCICustomScaleName', taskHandle, channel, data);
end

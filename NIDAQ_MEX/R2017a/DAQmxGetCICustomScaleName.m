% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICustomScaleName(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICustomScaleName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICustomScaleName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCICustomScaleName', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCICustomScaleName', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCICustomScaleName', taskHandle, channel, data, bufferSize);
end

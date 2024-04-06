% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOOutputType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOOutputType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOOutputType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCOOutputType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOOutputType', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCITCReached(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCITCReached', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCITCReached', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCITCReached', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCITCReached', taskHandle, channel, data);
end

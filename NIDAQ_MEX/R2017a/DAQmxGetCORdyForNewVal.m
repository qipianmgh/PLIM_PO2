% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCORdyForNewVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCORdyForNewVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCORdyForNewVal', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCORdyForNewVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCORdyForNewVal', taskHandle, channel, data);
end

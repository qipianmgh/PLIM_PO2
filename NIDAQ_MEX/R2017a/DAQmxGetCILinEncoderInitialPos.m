% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCILinEncoderInitialPos(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCILinEncoderInitialPos', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCILinEncoderInitialPos', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCILinEncoderInitialPos', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCILinEncoderInitialPos', taskHandle, channel, data);
end

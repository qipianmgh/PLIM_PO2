% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCILinEncoderInitialPos(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCILinEncoderInitialPos', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCILinEncoderInitialPos', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCILinEncoderInitialPos', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCILinEncoderInitialPos', taskHandle, channel, data);
end

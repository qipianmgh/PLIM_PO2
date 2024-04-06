% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIAngEncoderInitialAngle(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIAngEncoderInitialAngle', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIAngEncoderInitialAngle', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIAngEncoderInitialAngle', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIAngEncoderInitialAngle', taskHandle, channel, data);
end

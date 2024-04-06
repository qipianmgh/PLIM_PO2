% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIAngEncoderInitialAngle(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIAngEncoderInitialAngle', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIAngEncoderInitialAngle', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIAngEncoderInitialAngle', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIAngEncoderInitialAngle', taskHandle, channel, data);
end

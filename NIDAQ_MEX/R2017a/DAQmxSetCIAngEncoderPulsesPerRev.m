% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIAngEncoderPulsesPerRev(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIAngEncoderPulsesPerRev', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIAngEncoderPulsesPerRev', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIAngEncoderPulsesPerRev', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIAngEncoderPulsesPerRev', taskHandle, channel, data);
end

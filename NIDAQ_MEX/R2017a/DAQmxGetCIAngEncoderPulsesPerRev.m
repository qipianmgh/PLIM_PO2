% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIAngEncoderPulsesPerRev(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIAngEncoderPulsesPerRev', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIAngEncoderPulsesPerRev', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIAngEncoderPulsesPerRev', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIAngEncoderPulsesPerRev', taskHandle, channel, data);
end

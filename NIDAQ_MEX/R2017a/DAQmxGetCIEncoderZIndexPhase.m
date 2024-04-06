% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIEncoderZIndexPhase(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIEncoderZIndexPhase', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIEncoderZIndexPhase', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIEncoderZIndexPhase', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIEncoderZIndexPhase', taskHandle, channel, data);
end

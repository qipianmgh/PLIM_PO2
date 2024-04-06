% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIAngEncoderUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIAngEncoderUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIAngEncoderUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIAngEncoderUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIAngEncoderUnits', taskHandle, channel, data);
end

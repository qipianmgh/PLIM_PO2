% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCILinEncoderUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCILinEncoderUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCILinEncoderUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCILinEncoderUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCILinEncoderUnits', taskHandle, channel, data);
end

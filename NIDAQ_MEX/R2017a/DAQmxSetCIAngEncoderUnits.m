% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIAngEncoderUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIAngEncoderUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIAngEncoderUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIAngEncoderUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIAngEncoderUnits', taskHandle, channel, data);
end

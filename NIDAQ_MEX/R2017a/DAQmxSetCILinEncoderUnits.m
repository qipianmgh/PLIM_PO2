% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCILinEncoderUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCILinEncoderUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCILinEncoderUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCILinEncoderUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCILinEncoderUnits', taskHandle, channel, data);
end

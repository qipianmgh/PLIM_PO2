% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIDitherEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIDitherEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIDitherEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIDitherEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIDitherEnable', taskHandle, channel, data);
end

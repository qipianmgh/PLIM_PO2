% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIDitherEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIDitherEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIDitherEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIDitherEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIDitherEnable', taskHandle, channel, data);
end

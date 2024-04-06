% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetChanType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetChanType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetChanType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetChanType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetChanType', taskHandle, channel, data);
end

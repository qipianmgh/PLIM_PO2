% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICountEdgesDir(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICountEdgesDir', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesDir', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCICountEdgesDir', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICountEdgesDir', taskHandle, channel, data);
end

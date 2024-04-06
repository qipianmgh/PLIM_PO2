% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIMax(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIMax', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIMax', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIMax', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIMax', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIMax(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIMax', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIMax', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIMax', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIMax', taskHandle, channel, data);
end

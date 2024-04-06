% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOMax(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOMax', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOMax', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOMax', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOMax', taskHandle, channel, data);
end

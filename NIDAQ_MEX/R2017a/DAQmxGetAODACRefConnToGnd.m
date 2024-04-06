% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACRefConnToGnd(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACRefConnToGnd', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACRefConnToGnd', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAODACRefConnToGnd', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODACRefConnToGnd', taskHandle, channel, data);
end

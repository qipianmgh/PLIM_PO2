% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAODACRefConnToGnd(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACRefConnToGnd', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACRefConnToGnd', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAODACRefConnToGnd', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAODACRefConnToGnd', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOMax(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOMax', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOMax', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOMax', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOMax', taskHandle, channel, data);
end

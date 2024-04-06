% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIVoltagedBRef(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIVoltagedBRef', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIVoltagedBRef', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIVoltagedBRef', taskHandle, channel);
end

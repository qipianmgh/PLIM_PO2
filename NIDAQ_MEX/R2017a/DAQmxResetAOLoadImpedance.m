% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOLoadImpedance(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOLoadImpedance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOLoadImpedance', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOLoadImpedance', taskHandle, channel);
end

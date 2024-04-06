% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOLoadImpedance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOLoadImpedance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOLoadImpedance', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOLoadImpedance', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOLoadImpedance', taskHandle, channel, data);
end

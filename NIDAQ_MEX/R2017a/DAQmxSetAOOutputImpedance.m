% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOOutputImpedance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOOutputImpedance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOOutputImpedance', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOOutputImpedance', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOOutputImpedance', taskHandle, channel, data);
end

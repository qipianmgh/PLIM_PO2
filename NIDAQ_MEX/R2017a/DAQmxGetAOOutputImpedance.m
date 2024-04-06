% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOOutputImpedance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOOutputImpedance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOOutputImpedance', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOOutputImpedance', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOOutputImpedance', taskHandle, channel, data);
end

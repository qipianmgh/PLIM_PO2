% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOLoadImpedance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOLoadImpedance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOLoadImpedance', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOLoadImpedance', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOLoadImpedance', taskHandle, channel, data);
end
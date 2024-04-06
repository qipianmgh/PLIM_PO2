% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOFuncGenAmplitude(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOFuncGenAmplitude', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOFuncGenAmplitude', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOFuncGenAmplitude', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOFuncGenAmplitude', taskHandle, channel, data);
end

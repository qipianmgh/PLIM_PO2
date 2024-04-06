% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOFuncGenAmplitude(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOFuncGenAmplitude', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOFuncGenAmplitude', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOFuncGenAmplitude', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOFuncGenAmplitude', taskHandle, channel, data);
end

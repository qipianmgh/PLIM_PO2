% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOFuncGenAmplitude(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOFuncGenAmplitude', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOFuncGenAmplitude', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOFuncGenAmplitude', taskHandle, channel);
end

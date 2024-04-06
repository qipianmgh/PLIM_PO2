% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIChanCalPolyForwardCoeff(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIChanCalPolyForwardCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIChanCalPolyForwardCoeff', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIChanCalPolyForwardCoeff', taskHandle, channel);
end

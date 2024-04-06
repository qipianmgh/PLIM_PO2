% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIChanCalPolyReverseCoeff(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIChanCalPolyReverseCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIChanCalPolyReverseCoeff', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIChanCalPolyReverseCoeff', taskHandle, channel);
end

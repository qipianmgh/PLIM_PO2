% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIForceIEPESensorSensitivity(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIForceIEPESensorSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIForceIEPESensorSensitivity', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIForceIEPESensorSensitivity', taskHandle, channel);
end

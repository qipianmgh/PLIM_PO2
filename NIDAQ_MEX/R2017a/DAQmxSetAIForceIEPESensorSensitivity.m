% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIForceIEPESensorSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIForceIEPESensorSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIForceIEPESensorSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIForceIEPESensorSensitivity', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIForceIEPESensorSensitivity', taskHandle, channel, data);
end

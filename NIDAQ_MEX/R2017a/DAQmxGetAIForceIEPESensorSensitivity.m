% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIForceIEPESensorSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIForceIEPESensorSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIForceIEPESensorSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIForceIEPESensorSensitivity', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIForceIEPESensorSensitivity', taskHandle, channel, data);
end

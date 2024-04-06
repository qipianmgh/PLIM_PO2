% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgePolyReverseCoeff(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgePolyReverseCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgePolyReverseCoeff', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgePolyReverseCoeff', taskHandle, channel);
end

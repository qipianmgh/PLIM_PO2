% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgePolyForwardCoeff(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgePolyForwardCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgePolyForwardCoeff', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgePolyForwardCoeff', taskHandle, channel);
end

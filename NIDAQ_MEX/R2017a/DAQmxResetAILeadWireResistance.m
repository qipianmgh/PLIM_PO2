% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAILeadWireResistance(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAILeadWireResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAILeadWireResistance', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAILeadWireResistance', taskHandle, channel);
end

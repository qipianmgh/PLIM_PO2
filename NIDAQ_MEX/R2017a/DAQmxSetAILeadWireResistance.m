% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILeadWireResistance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILeadWireResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILeadWireResistance', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAILeadWireResistance', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILeadWireResistance', taskHandle, channel, data);
end

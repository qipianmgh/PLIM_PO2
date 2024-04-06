% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILeadWireResistance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILeadWireResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILeadWireResistance', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAILeadWireResistance', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILeadWireResistance', taskHandle, channel, data);
end

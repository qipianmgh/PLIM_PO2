% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIChanCalTablePreScaledVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalTablePreScaledVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalTablePreScaledVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIChanCalTablePreScaledVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalTablePreScaledVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIChanCalTablePreScaledVals', taskHandle, channel, data, arraySizeInElements);
end

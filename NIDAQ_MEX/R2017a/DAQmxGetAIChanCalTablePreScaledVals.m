% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalTablePreScaledVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalTablePreScaledVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalTablePreScaledVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIChanCalTablePreScaledVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIChanCalTablePreScaledVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalTablePreScaledVals', taskHandle, channel, data, arraySizeInElements);
end

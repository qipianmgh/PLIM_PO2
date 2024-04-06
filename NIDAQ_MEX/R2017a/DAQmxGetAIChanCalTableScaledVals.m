% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalTableScaledVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalTableScaledVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalTableScaledVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIChanCalTableScaledVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIChanCalTableScaledVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalTableScaledVals', taskHandle, channel, data, arraySizeInElements);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIChanCalTableScaledVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalTableScaledVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalTableScaledVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIChanCalTableScaledVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalTableScaledVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIChanCalTableScaledVals', taskHandle, channel, data, arraySizeInElements);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIDevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIDevScalingCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIDevScalingCoeff', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIDevScalingCoeff', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIDevScalingCoeff', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIDevScalingCoeff', taskHandle, channel, data, arraySizeInElements);
end

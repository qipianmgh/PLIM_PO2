% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODevScalingCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODevScalingCoeff', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAODevScalingCoeff', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAODevScalingCoeff', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAODevScalingCoeff', taskHandle, channel, data, arraySizeInElements);
end

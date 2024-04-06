% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalVerifAcqVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalVerifAcqVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalVerifAcqVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIChanCalVerifAcqVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIChanCalVerifAcqVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalVerifAcqVals', taskHandle, channel, data, arraySizeInElements);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIChanCalVerifAcqVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalVerifAcqVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalVerifAcqVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIChanCalVerifAcqVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalVerifAcqVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIChanCalVerifAcqVals', taskHandle, channel, data, arraySizeInElements);
end

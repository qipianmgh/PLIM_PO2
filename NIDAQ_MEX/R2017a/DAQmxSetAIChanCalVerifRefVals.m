% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIChanCalVerifRefVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalVerifRefVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalVerifRefVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIChanCalVerifRefVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalVerifRefVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIChanCalVerifRefVals', taskHandle, channel, data, arraySizeInElements);
end

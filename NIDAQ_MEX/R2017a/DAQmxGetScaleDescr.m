% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleDescr(scaleName, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleDescr', 'scaleName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetScaleDescr', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetScaleDescr', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetScaleDescr', scaleName, data, bufferSize);
end

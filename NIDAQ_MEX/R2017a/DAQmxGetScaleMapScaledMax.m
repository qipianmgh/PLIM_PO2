% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleMapScaledMax(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleMapScaledMax', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScaleMapScaledMax', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetScaleMapScaledMax', scaleName, data);
end

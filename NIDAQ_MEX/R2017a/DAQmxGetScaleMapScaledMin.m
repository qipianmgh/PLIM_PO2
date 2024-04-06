% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleMapScaledMin(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleMapScaledMin', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScaleMapScaledMin', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetScaleMapScaledMin', scaleName, data);
end

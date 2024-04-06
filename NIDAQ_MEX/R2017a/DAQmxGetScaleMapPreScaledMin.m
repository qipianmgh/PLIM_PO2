% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleMapPreScaledMin(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleMapPreScaledMin', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScaleMapPreScaledMin', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetScaleMapPreScaledMin', scaleName, data);
end

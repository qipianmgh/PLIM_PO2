% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetScaleMapPreScaledMin(scaleName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleMapPreScaledMin', 'scaleName', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetScaleMapPreScaledMin', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetScaleMapPreScaledMin', scaleName, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetScaleMapScaledMin(scaleName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleMapScaledMin', 'scaleName', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetScaleMapScaledMin', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetScaleMapScaledMin', scaleName, data);
end

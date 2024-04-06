% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleMapPreScaledMax(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleMapPreScaledMax', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScaleMapPreScaledMax', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetScaleMapPreScaledMax', scaleName, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetScaleMapPreScaledMax(scaleName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleMapPreScaledMax', 'scaleName', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetScaleMapPreScaledMax', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetScaleMapPreScaledMax', scaleName, data);
end

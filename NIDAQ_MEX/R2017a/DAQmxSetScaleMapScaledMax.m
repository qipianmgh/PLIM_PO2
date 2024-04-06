% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetScaleMapScaledMax(scaleName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleMapScaledMax', 'scaleName', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetScaleMapScaledMax', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetScaleMapScaledMax', scaleName, data);
end

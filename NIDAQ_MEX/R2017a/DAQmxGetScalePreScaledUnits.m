% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScalePreScaledUnits(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScalePreScaledUnits', 'scaleName', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetScalePreScaledUnits', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetScalePreScaledUnits', scaleName, data);
end

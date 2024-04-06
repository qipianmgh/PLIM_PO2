% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetScalePreScaledUnits(scaleName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScalePreScaledUnits', 'scaleName', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetScalePreScaledUnits', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetScalePreScaledUnits', scaleName, data);
end

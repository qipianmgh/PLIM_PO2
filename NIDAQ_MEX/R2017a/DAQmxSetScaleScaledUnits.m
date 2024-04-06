% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetScaleScaledUnits(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleScaledUnits', 'scaleName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetScaleScaledUnits', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetScaleScaledUnits', scaleName, data);
end

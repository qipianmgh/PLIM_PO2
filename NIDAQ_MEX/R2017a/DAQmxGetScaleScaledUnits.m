% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleScaledUnits(scaleName, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleScaledUnits', 'scaleName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetScaleScaledUnits', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetScaleScaledUnits', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetScaleScaledUnits', scaleName, data, bufferSize);
end

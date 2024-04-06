% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleLinSlope(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleLinSlope', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScaleLinSlope', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetScaleLinSlope', scaleName, data);
end

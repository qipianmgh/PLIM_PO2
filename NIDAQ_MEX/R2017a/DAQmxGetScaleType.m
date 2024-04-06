% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleType(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleType', 'scaleName', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetScaleType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetScaleType', scaleName, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleLinYIntercept(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleLinYIntercept', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScaleLinYIntercept', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetScaleLinYIntercept', scaleName, data);
end

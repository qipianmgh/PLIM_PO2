% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetScaleLinYIntercept(scaleName, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleLinYIntercept', 'scaleName', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetScaleLinYIntercept', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetScaleLinYIntercept', scaleName, data);
end

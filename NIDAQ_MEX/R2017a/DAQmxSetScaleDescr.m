% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetScaleDescr(scaleName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleDescr', 'scaleName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetScaleDescr', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetScaleDescr', scaleName, data);
end

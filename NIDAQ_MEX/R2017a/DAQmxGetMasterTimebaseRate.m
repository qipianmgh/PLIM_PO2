% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetMasterTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetMasterTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetMasterTimebaseRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetMasterTimebaseRate', taskHandle, data);
end

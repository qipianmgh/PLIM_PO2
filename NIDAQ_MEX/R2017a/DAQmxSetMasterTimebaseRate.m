% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetMasterTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetMasterTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetMasterTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetMasterTimebaseRate', taskHandle, data);
end

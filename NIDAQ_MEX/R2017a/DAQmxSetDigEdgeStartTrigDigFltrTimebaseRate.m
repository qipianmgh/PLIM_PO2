% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeStartTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigDigFltrEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeStartTrigDigFltrEnable', taskHandle, data);
end

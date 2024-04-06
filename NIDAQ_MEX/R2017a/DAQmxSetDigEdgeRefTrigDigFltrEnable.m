% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeRefTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeRefTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDigEdgeRefTrigDigFltrEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeRefTrigDigFltrEnable', taskHandle, data);
end

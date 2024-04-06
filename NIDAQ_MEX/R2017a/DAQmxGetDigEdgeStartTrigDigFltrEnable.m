% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeStartTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeStartTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDigEdgeStartTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeStartTrigDigFltrEnable', taskHandle, data);
end

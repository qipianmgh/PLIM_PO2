% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeAdvTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeAdvTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDigEdgeAdvTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeAdvTrigDigFltrEnable', taskHandle, data);
end

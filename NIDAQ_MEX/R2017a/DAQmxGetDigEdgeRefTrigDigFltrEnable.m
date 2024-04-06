% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeRefTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeRefTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDigEdgeRefTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeRefTrigDigFltrEnable', taskHandle, data);
end

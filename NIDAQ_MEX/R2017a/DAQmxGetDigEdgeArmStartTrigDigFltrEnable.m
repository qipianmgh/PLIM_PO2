% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeArmStartTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeArmStartTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDigEdgeArmStartTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeArmStartTrigDigFltrEnable', taskHandle, data);
end

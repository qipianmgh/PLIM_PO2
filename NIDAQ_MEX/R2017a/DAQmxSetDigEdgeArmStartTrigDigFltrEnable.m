% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeArmStartTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigDigFltrEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeArmStartTrigDigFltrEnable', taskHandle, data);
end

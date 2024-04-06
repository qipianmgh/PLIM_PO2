% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth', taskHandle, data);
end

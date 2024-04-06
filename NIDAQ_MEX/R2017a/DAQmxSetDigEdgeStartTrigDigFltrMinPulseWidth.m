% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth', taskHandle, data);
end

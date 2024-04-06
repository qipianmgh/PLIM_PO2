% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate', taskHandle);
end

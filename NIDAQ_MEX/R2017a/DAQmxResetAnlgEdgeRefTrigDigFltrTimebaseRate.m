% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate', taskHandle);
end

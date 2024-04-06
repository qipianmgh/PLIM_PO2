% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedCtrOutEventPulsePolarity(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedCtrOutEventPulsePolarity', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedCtrOutEventPulsePolarity', taskHandle);
end

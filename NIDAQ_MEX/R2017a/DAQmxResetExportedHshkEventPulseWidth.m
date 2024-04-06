% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedHshkEventPulseWidth(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedHshkEventPulseWidth', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedHshkEventPulseWidth', taskHandle);
end

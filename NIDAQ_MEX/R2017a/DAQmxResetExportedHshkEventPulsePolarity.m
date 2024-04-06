% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedHshkEventPulsePolarity(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedHshkEventPulsePolarity', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedHshkEventPulsePolarity', taskHandle);
end

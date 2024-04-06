% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedHshkEventDelay(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedHshkEventDelay', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedHshkEventDelay', taskHandle);
end

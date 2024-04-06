% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetRealTimeReportMissedSamp(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetRealTimeReportMissedSamp', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetRealTimeReportMissedSamp', taskHandle);
end

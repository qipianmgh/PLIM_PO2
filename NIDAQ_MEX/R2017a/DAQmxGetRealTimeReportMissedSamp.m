% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRealTimeReportMissedSamp(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRealTimeReportMissedSamp', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetRealTimeReportMissedSamp', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRealTimeReportMissedSamp', taskHandle, data);
end

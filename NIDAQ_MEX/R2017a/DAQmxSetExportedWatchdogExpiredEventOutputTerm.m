% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedWatchdogExpiredEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedWatchdogExpiredEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedWatchdogExpiredEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedWatchdogExpiredEventOutputTerm', taskHandle, data);
end

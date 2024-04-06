% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedSyncPulseEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedSyncPulseEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedSyncPulseEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedSyncPulseEventOutputTerm', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedHshkEventInterlockedAssertOnStart(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedHshkEventInterlockedAssertOnStart', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetExportedHshkEventInterlockedAssertOnStart', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedHshkEventInterlockedAssertOnStart', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedHshkEventInterlockedAssertOnStart(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedHshkEventInterlockedAssertOnStart', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetExportedHshkEventInterlockedAssertOnStart', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedHshkEventInterlockedAssertOnStart', taskHandle, data);
end

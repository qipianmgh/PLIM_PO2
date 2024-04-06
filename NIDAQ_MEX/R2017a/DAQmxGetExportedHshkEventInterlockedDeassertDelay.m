% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedHshkEventInterlockedDeassertDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedHshkEventInterlockedDeassertDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetExportedHshkEventInterlockedDeassertDelay', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedHshkEventInterlockedDeassertDelay', taskHandle, data);
end

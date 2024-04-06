% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedHshkEventInterlockedDeassertDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedHshkEventInterlockedDeassertDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetExportedHshkEventInterlockedDeassertDelay', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedHshkEventInterlockedDeassertDelay', taskHandle, data);
end

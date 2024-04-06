% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedHshkEventInterlockedAssertedLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedHshkEventInterlockedAssertedLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedHshkEventInterlockedAssertedLvl', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedHshkEventInterlockedAssertedLvl', taskHandle, data);
end

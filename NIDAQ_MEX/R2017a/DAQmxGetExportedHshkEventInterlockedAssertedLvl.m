% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedHshkEventInterlockedAssertedLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedHshkEventInterlockedAssertedLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedHshkEventInterlockedAssertedLvl', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedHshkEventInterlockedAssertedLvl', taskHandle, data);
end

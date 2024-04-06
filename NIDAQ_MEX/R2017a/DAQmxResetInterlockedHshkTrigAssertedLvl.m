% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetInterlockedHshkTrigAssertedLvl(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetInterlockedHshkTrigAssertedLvl', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetInterlockedHshkTrigAssertedLvl', taskHandle);
end

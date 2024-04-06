% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetInterlockedHshkTrigAssertedLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetInterlockedHshkTrigAssertedLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetInterlockedHshkTrigAssertedLvl', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetInterlockedHshkTrigAssertedLvl', taskHandle, data);
end

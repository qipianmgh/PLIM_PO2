% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetInterlockedHshkTrigAssertedLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetInterlockedHshkTrigAssertedLvl', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetInterlockedHshkTrigAssertedLvl', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetInterlockedHshkTrigAssertedLvl', taskHandle, data);
end

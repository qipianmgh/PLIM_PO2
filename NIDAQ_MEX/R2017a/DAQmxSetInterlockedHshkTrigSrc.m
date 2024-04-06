% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetInterlockedHshkTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetInterlockedHshkTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetInterlockedHshkTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetInterlockedHshkTrigSrc', taskHandle, data);
end

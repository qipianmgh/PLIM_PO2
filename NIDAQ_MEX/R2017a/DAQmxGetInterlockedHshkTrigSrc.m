% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetInterlockedHshkTrigSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetInterlockedHshkTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetInterlockedHshkTrigSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetInterlockedHshkTrigSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetInterlockedHshkTrigSrc', taskHandle, data, bufferSize);
end

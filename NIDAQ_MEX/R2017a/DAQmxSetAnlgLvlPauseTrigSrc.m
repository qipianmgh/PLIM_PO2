% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAnlgLvlPauseTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAnlgLvlPauseTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetAnlgLvlPauseTrigSrc', taskHandle, data);
end

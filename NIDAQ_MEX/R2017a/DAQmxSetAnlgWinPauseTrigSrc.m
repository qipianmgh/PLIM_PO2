% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAnlgWinPauseTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAnlgWinPauseTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetAnlgWinPauseTrigSrc', taskHandle, data);
end

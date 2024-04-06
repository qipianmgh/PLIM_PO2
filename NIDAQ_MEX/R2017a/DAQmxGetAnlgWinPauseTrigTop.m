% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinPauseTrigTop(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinPauseTrigTop', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgWinPauseTrigTop', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinPauseTrigTop', taskHandle, data);
end

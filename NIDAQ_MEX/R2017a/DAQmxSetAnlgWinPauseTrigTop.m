% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinPauseTrigTop(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigTop', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigTop', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinPauseTrigTop', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinPauseTrigBtm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinPauseTrigBtm', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgWinPauseTrigBtm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinPauseTrigBtm', taskHandle, data);
end

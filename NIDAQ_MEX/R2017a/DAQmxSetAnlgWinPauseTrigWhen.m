% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinPauseTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinPauseTrigWhen', taskHandle, data);
end

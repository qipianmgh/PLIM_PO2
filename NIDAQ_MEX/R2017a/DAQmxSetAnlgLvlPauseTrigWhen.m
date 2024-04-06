% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgLvlPauseTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgLvlPauseTrigWhen', taskHandle, data);
end

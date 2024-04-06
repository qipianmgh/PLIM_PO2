% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgLvlPauseTrigHyst(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigHyst', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigHyst', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgLvlPauseTrigHyst', taskHandle, data);
end

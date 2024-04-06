% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgLvlPauseTrigHyst(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgLvlPauseTrigHyst', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgLvlPauseTrigHyst', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgLvlPauseTrigHyst', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinPauseTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinPauseTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAnlgWinPauseTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinPauseTrigDigFltrEnable', taskHandle, data);
end

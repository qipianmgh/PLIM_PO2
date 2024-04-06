% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgLvlPauseTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgLvlPauseTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAnlgLvlPauseTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgLvlPauseTrigDigFltrEnable', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigLvlPauseTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigLvlPauseTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDigLvlPauseTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigLvlPauseTrigDigFltrEnable', taskHandle, data);
end

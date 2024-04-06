% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigLvlPauseTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigDigFltrEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigLvlPauseTrigDigFltrEnable', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigLvlPauseTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigLvlPauseTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigLvlPauseTrigSrc', taskHandle, data);
end

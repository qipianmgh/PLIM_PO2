% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigLvlPauseTrigSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigLvlPauseTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigLvlPauseTrigSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigLvlPauseTrigSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigLvlPauseTrigSrc', taskHandle, data, bufferSize);
end

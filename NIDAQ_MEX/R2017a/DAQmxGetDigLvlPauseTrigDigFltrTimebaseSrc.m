% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc', taskHandle, data, bufferSize);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeArmStartTrigSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeArmStartTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigEdgeArmStartTrigSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigEdgeArmStartTrigSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeArmStartTrigSrc', taskHandle, data, bufferSize);
end

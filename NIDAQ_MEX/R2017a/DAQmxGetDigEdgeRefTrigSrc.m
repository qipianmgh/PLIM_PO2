% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigEdgeRefTrigSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigEdgeRefTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDigEdgeRefTrigSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDigEdgeRefTrigSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDigEdgeRefTrigSrc', taskHandle, data, bufferSize);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeStartTrigSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeStartTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAnlgEdgeStartTrigSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAnlgEdgeStartTrigSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeStartTrigSrc', taskHandle, data, bufferSize);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc', taskHandle, data, bufferSize);
end

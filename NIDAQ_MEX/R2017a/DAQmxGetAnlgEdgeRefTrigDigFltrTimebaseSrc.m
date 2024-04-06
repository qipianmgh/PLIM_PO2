% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc', taskHandle, data, bufferSize);
end

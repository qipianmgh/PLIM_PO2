% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAIConvDigFltrTimebaseSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAIConvDigFltrTimebaseSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvDigFltrTimebaseSrc', taskHandle, data, bufferSize);
end

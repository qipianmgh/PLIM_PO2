% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetLoggingFilePath(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetLoggingFilePath', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetLoggingFilePath', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetLoggingFilePath', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetLoggingFilePath', taskHandle, data, bufferSize);
end

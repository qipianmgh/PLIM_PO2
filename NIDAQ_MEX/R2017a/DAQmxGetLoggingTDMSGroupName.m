% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetLoggingTDMSGroupName(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetLoggingTDMSGroupName', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetLoggingTDMSGroupName', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetLoggingTDMSGroupName', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetLoggingTDMSGroupName', taskHandle, data, bufferSize);
end

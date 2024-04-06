% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetBufOutputBufSize(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetBufOutputBufSize', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetBufOutputBufSize', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetBufOutputBufSize', taskHandle, data);
end

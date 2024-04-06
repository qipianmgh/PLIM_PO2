% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetBufInputBufSize(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetBufInputBufSize', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetBufInputBufSize', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetBufInputBufSize', taskHandle, data);
end

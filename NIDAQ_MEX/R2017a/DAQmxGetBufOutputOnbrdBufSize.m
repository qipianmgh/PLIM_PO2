% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetBufOutputOnbrdBufSize(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetBufOutputOnbrdBufSize', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetBufOutputOnbrdBufSize', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetBufOutputOnbrdBufSize', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetBufOutputOnbrdBufSize(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetBufOutputOnbrdBufSize', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetBufOutputOnbrdBufSize', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetBufOutputOnbrdBufSize', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetBufInputOnbrdBufSize(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetBufInputOnbrdBufSize', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetBufInputOnbrdBufSize', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetBufInputOnbrdBufSize', taskHandle, data);
end

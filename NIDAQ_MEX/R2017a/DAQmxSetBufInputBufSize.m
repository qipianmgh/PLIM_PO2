% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetBufInputBufSize(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetBufInputBufSize', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetBufInputBufSize', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetBufInputBufSize', taskHandle, data);
end

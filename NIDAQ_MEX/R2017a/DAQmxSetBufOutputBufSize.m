% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetBufOutputBufSize(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetBufOutputBufSize', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetBufOutputBufSize', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetBufOutputBufSize', taskHandle, data);
end

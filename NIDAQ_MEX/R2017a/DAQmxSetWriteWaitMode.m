% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWriteWaitMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWriteWaitMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetWriteWaitMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetWriteWaitMode', taskHandle, data);
end

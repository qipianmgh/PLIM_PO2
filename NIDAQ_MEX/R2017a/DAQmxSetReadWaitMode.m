% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetReadWaitMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadWaitMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetReadWaitMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetReadWaitMode', taskHandle, data);
end

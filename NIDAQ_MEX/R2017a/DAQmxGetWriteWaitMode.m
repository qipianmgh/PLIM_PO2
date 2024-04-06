% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteWaitMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteWaitMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetWriteWaitMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteWaitMode', taskHandle, data);
end

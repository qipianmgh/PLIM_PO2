% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWriteOffset(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWriteOffset', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetWriteOffset', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetWriteOffset', taskHandle, data);
end

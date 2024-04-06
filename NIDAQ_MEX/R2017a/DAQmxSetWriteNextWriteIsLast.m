% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWriteNextWriteIsLast(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWriteNextWriteIsLast', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetWriteNextWriteIsLast', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetWriteNextWriteIsLast', taskHandle, data);
end

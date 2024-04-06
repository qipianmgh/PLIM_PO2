% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteNextWriteIsLast(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteNextWriteIsLast', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWriteNextWriteIsLast', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteNextWriteIsLast', taskHandle, data);
end

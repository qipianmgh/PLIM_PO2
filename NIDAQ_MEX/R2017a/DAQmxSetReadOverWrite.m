% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetReadOverWrite(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadOverWrite', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetReadOverWrite', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetReadOverWrite', taskHandle, data);
end

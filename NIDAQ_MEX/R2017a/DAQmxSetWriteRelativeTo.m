% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWriteRelativeTo(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWriteRelativeTo', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetWriteRelativeTo', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetWriteRelativeTo', taskHandle, data);
end

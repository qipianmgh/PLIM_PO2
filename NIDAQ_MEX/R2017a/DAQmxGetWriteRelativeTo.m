% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteRelativeTo(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteRelativeTo', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetWriteRelativeTo', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteRelativeTo', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetReadRelativeTo(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadRelativeTo', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetReadRelativeTo', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetReadRelativeTo', taskHandle, data);
end

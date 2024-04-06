% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetReadAutoStart(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadAutoStart', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetReadAutoStart', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetReadAutoStart', taskHandle, data);
end

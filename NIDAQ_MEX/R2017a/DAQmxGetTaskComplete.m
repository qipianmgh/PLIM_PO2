% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetTaskComplete(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTaskComplete', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetTaskComplete', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetTaskComplete', taskHandle, data);
end

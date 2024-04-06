% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetTaskNumDevices(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTaskNumDevices', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetTaskNumDevices', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetTaskNumDevices', taskHandle, data);
end

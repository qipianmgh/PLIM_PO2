% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetLoggingMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetLoggingMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetLoggingMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetLoggingMode', taskHandle, data);
end

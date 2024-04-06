% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetLoggingMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetLoggingMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetLoggingMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetLoggingMode', taskHandle, data);
end

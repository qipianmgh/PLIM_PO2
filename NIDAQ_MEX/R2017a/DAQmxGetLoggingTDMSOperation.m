% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetLoggingTDMSOperation(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetLoggingTDMSOperation', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetLoggingTDMSOperation', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetLoggingTDMSOperation', taskHandle, data);
end

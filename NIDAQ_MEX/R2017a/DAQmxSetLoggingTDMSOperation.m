% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetLoggingTDMSOperation(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetLoggingTDMSOperation', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetLoggingTDMSOperation', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetLoggingTDMSOperation', taskHandle, data);
end

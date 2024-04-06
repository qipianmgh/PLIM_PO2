% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetLoggingFilePath(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetLoggingFilePath', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetLoggingFilePath', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetLoggingFilePath', taskHandle, data);
end

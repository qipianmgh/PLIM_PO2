% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteCurrWritePos(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteCurrWritePos', 'taskHandle', 1);
    validateattributes(data, {'uint64'}, {'vector'}, 'DAQmxGetWriteCurrWritePos', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteCurrWritePos', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteRawDataWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteRawDataWidth', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWriteRawDataWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteRawDataWidth', taskHandle, data);
end

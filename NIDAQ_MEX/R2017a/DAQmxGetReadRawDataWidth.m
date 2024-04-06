% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadRawDataWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadRawDataWidth', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadRawDataWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadRawDataWidth', taskHandle, data);
end

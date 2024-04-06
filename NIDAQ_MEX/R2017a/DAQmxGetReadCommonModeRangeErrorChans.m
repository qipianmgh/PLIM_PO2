% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadCommonModeRangeErrorChans(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadCommonModeRangeErrorChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetReadCommonModeRangeErrorChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetReadCommonModeRangeErrorChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetReadCommonModeRangeErrorChans', taskHandle, data, bufferSize);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadCommonModeRangeErrorChansExist(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadCommonModeRangeErrorChansExist', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadCommonModeRangeErrorChansExist', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadCommonModeRangeErrorChansExist', taskHandle, data);
end

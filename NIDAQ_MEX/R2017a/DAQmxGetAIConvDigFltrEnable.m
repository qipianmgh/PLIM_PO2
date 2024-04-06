% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIConvDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvDigFltrEnable', taskHandle, data);
end

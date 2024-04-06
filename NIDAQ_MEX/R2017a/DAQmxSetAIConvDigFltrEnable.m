% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIConvDigFltrEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAIConvDigFltrEnable', taskHandle, data);
end

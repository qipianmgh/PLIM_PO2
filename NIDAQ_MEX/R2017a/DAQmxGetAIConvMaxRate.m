% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvMaxRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvMaxRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIConvMaxRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvMaxRate', taskHandle, data);
end

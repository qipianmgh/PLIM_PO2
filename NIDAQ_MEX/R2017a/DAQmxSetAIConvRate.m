% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIConvRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAIConvRate', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIConvDigFltrTimebaseRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvDigFltrTimebaseRate', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIConvDigFltrTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAIConvDigFltrTimebaseRate', taskHandle, data);
end

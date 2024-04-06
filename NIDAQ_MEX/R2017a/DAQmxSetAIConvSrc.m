% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIConvSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAIConvSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetAIConvSrc', taskHandle, data);
end

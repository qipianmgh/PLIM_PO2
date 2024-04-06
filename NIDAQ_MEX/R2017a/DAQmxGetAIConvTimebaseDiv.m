% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvTimebaseDiv(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvTimebaseDiv', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIConvTimebaseDiv', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvTimebaseDiv', taskHandle, data);
end

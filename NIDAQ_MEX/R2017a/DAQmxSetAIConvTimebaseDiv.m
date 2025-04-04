% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvTimebaseDiv(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvTimebaseDiv', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIConvTimebaseDiv', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAIConvTimebaseDiv', taskHandle, data);
end

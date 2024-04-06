% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvTimebaseDivEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvTimebaseDivEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxGetAIConvTimebaseDivEx', 'deviceNames', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIConvTimebaseDivEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvTimebaseDivEx', taskHandle, deviceNames, data);
end

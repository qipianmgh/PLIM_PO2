% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvTimebaseDivEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvTimebaseDivEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvTimebaseDivEx', 'deviceNames', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIConvTimebaseDivEx', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIConvTimebaseDivEx', taskHandle, deviceNames, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetArmStartTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetArmStartTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetArmStartTrigType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetArmStartTrigType', taskHandle, data);
end

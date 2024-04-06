% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetArmStartTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetArmStartTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetArmStartTrigType', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetArmStartTrigType', taskHandle, data);
end

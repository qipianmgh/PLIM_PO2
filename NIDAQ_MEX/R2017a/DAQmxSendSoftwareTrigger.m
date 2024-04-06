% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSendSoftwareTrigger(taskHandle, triggerID)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSendSoftwareTrigger', 'taskHandle', 1);
    validateattributes(triggerID, {'int32'}, {'scalar'}, 'DAQmxSendSoftwareTrigger', 'triggerID', 2);
    [status]= mexNIDAQmx('DAQmxSendSoftwareTrigger', taskHandle, triggerID);
end

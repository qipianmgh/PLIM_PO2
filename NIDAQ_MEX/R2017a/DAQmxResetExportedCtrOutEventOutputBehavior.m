% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedCtrOutEventOutputBehavior(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedCtrOutEventOutputBehavior', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedCtrOutEventOutputBehavior', taskHandle);
end

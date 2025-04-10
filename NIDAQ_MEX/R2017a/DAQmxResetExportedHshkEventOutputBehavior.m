% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetExportedHshkEventOutputBehavior(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetExportedHshkEventOutputBehavior', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetExportedHshkEventOutputBehavior', taskHandle);
end

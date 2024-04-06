% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvDigSyncEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvDigSyncEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAIConvDigSyncEnable', taskHandle);
end

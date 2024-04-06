% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOEnhancedImageRejectionEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOEnhancedImageRejectionEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOEnhancedImageRejectionEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOEnhancedImageRejectionEnable', taskHandle, channel);
end

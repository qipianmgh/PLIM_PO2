% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOEnhancedImageRejectionEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOEnhancedImageRejectionEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOEnhancedImageRejectionEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAOEnhancedImageRejectionEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOEnhancedImageRejectionEnable', taskHandle, channel, data);
end

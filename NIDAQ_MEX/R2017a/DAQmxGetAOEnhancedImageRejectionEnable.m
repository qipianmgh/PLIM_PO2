% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOEnhancedImageRejectionEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOEnhancedImageRejectionEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOEnhancedImageRejectionEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAOEnhancedImageRejectionEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOEnhancedImageRejectionEnable', taskHandle, channel, data);
end

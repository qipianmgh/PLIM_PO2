% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIEnhancedAliasRejectionEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIEnhancedAliasRejectionEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIEnhancedAliasRejectionEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIEnhancedAliasRejectionEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIEnhancedAliasRejectionEnable', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACRefSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACRefSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACRefSrc', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAODACRefSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODACRefSrc', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAODACRefSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACRefSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACRefSrc', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAODACRefSrc', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAODACRefSrc', taskHandle, channel, data);
end

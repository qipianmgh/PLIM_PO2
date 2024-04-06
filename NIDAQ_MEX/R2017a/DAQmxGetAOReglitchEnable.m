% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOReglitchEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOReglitchEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOReglitchEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAOReglitchEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOReglitchEnable', taskHandle, channel, data);
end

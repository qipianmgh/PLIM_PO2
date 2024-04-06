% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOReglitchEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOReglitchEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOReglitchEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAOReglitchEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOReglitchEnable', taskHandle, channel, data);
end

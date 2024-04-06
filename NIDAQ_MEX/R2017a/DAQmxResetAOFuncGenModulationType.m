% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOFuncGenModulationType(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOFuncGenModulationType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOFuncGenModulationType', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOFuncGenModulationType', taskHandle, channel);
end

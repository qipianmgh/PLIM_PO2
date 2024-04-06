% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOFuncGenModulationType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOFuncGenModulationType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOFuncGenModulationType', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAOFuncGenModulationType', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOFuncGenModulationType', taskHandle, channel, data);
end

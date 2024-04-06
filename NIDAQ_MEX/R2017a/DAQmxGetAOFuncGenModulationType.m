% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOFuncGenModulationType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOFuncGenModulationType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOFuncGenModulationType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAOFuncGenModulationType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOFuncGenModulationType', taskHandle, channel, data);
end

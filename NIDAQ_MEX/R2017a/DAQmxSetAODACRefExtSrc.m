% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAODACRefExtSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACRefExtSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACRefExtSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAODACRefExtSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAODACRefExtSrc', taskHandle, channel, data);
end

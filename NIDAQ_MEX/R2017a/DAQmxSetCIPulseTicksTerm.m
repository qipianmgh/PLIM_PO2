% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIPulseTicksTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseTicksTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseTicksTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIPulseTicksTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIPulseTicksTerm', taskHandle, channel, data);
end

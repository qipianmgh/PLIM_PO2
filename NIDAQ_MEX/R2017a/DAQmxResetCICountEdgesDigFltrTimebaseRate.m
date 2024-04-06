% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICountEdgesDigFltrTimebaseRate(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICountEdgesDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICountEdgesDigFltrTimebaseRate', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICountEdgesDigFltrTimebaseRate', taskHandle, channel);
end

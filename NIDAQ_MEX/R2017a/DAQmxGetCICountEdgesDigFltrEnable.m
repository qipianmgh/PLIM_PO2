% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICountEdgesDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICountEdgesDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICountEdgesDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCICountEdgesDigFltrEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICountEdgesDigFltrEnable', taskHandle, channel, data);
end

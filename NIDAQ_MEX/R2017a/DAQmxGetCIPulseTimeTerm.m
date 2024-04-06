% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseTimeTerm(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseTimeTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseTimeTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIPulseTimeTerm', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIPulseTimeTerm', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseTimeTerm', taskHandle, channel, data, bufferSize);
end

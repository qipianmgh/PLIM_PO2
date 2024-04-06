% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadChannelsToRead(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadChannelsToRead', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetReadChannelsToRead', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetReadChannelsToRead', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetReadChannelsToRead', taskHandle, data, bufferSize);
end

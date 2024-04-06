% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOverloadedChans(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOverloadedChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetReadOverloadedChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetReadOverloadedChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetReadOverloadedChans', taskHandle, data, bufferSize);
end

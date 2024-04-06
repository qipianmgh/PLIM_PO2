% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOvercurrentChans(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOvercurrentChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetReadOvercurrentChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetReadOvercurrentChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetReadOvercurrentChans', taskHandle, data, bufferSize);
end

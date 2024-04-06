% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadOpenCurrentLoopChans(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadOpenCurrentLoopChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetReadOpenCurrentLoopChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetReadOpenCurrentLoopChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetReadOpenCurrentLoopChans', taskHandle, data, bufferSize);
end

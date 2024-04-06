% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, buffer] = DAQmxGetNthTaskReadChannel(taskHandle, index, buffer, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetNthTaskReadChannel', 'taskHandle', 1);
    validateattributes(index, {'uint32'}, {'scalar'}, 'DAQmxGetNthTaskReadChannel', 'index', 2);
    validateattributes(buffer, {'char'}, {'vector'}, 'DAQmxGetNthTaskReadChannel', 'buffer', 3);
    validateattributes(bufferSize, {'int32'}, {'scalar'}, 'DAQmxGetNthTaskReadChannel', 'bufferSize', 4);
    [status, buffer]= mexNIDAQmx('DAQmxGetNthTaskReadChannel', taskHandle, index, buffer, bufferSize);
end

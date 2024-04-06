% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, buffer] = DAQmxGetNthTaskChannel(taskHandle, index, buffer, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetNthTaskChannel', 'taskHandle', 1);
    validateattributes(index, {'uint32'}, {'scalar'}, 'DAQmxGetNthTaskChannel', 'index', 2);
    validateattributes(buffer, {'char'}, {'vector'}, 'DAQmxGetNthTaskChannel', 'buffer', 3);
    validateattributes(bufferSize, {'int32'}, {'scalar'}, 'DAQmxGetNthTaskChannel', 'bufferSize', 4);
    [status, buffer]= mexNIDAQmx('DAQmxGetNthTaskChannel', taskHandle, index, buffer, bufferSize);
end

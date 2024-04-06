% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, buffer] = DAQmxGetNthTaskDevice(taskHandle, index, buffer, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetNthTaskDevice', 'taskHandle', 1);
    validateattributes(index, {'uint32'}, {'scalar'}, 'DAQmxGetNthTaskDevice', 'index', 2);
    validateattributes(buffer, {'char'}, {'vector'}, 'DAQmxGetNthTaskDevice', 'buffer', 3);
    validateattributes(bufferSize, {'int32'}, {'scalar'}, 'DAQmxGetNthTaskDevice', 'bufferSize', 4);
    [status, buffer]= mexNIDAQmx('DAQmxGetNthTaskDevice', taskHandle, index, buffer, bufferSize);
end

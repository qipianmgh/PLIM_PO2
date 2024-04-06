% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteOpenCurrentLoopChans(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteOpenCurrentLoopChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetWriteOpenCurrentLoopChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetWriteOpenCurrentLoopChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetWriteOpenCurrentLoopChans', taskHandle, data, bufferSize);
end

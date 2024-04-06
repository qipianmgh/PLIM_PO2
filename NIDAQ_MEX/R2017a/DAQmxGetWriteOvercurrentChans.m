% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteOvercurrentChans(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteOvercurrentChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetWriteOvercurrentChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetWriteOvercurrentChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetWriteOvercurrentChans', taskHandle, data, bufferSize);
end

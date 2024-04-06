% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetMasterTimebaseSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetMasterTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetMasterTimebaseSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetMasterTimebaseSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetMasterTimebaseSrc', taskHandle, data, bufferSize);
end

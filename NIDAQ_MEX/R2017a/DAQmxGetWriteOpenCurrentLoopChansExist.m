% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteOpenCurrentLoopChansExist(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteOpenCurrentLoopChansExist', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWriteOpenCurrentLoopChansExist', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteOpenCurrentLoopChansExist', taskHandle, data);
end

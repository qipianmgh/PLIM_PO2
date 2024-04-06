% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetMasterTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetMasterTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetMasterTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetMasterTimebaseSrc', taskHandle, data);
end

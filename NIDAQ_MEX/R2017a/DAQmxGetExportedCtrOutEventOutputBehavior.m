% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedCtrOutEventOutputBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedCtrOutEventOutputBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedCtrOutEventOutputBehavior', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedCtrOutEventOutputBehavior', taskHandle, data);
end

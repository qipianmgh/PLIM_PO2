% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedCtrOutEventOutputBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedCtrOutEventOutputBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedCtrOutEventOutputBehavior', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedCtrOutEventOutputBehavior', taskHandle, data);
end

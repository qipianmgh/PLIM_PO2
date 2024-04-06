% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedHshkEventOutputBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedHshkEventOutputBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedHshkEventOutputBehavior', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedHshkEventOutputBehavior', taskHandle, data);
end

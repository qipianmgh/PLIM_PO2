% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedCtrOutEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedCtrOutEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedCtrOutEventPulsePolarity', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedCtrOutEventPulsePolarity', taskHandle, data);
end

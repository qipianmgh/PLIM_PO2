% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedHshkEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedHshkEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedHshkEventPulsePolarity', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedHshkEventPulsePolarity', taskHandle, data);
end

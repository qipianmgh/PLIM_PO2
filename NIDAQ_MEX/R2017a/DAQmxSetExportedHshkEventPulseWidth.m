% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedHshkEventPulseWidth(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedHshkEventPulseWidth', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetExportedHshkEventPulseWidth', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedHshkEventPulseWidth', taskHandle, data);
end

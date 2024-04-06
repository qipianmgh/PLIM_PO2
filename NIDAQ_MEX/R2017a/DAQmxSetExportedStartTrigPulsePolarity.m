% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedStartTrigPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedStartTrigPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedStartTrigPulsePolarity', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedStartTrigPulsePolarity', taskHandle, data);
end

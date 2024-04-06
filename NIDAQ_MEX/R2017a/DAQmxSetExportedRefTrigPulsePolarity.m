% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedRefTrigPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedRefTrigPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetExportedRefTrigPulsePolarity', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetExportedRefTrigPulsePolarity', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedCtrOutEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedCtrOutEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedCtrOutEventPulsePolarity', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedCtrOutEventPulsePolarity', taskHandle, data);
end

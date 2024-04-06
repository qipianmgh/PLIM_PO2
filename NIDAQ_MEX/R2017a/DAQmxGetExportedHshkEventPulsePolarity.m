% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedHshkEventPulsePolarity(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedHshkEventPulsePolarity', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedHshkEventPulsePolarity', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedHshkEventPulsePolarity', taskHandle, data);
end

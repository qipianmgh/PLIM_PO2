% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedHshkEventDelay(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedHshkEventDelay', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetExportedHshkEventDelay', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedHshkEventDelay', taskHandle, data);
end

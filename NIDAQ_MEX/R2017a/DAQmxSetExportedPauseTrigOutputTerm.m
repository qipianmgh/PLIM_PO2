% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedPauseTrigOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedPauseTrigOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedPauseTrigOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedPauseTrigOutputTerm', taskHandle, data);
end

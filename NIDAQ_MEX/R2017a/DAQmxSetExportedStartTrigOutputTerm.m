% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedStartTrigOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedStartTrigOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedStartTrigOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedStartTrigOutputTerm', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedAdvTrigOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedAdvTrigOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedAdvTrigOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedAdvTrigOutputTerm', taskHandle, data);
end

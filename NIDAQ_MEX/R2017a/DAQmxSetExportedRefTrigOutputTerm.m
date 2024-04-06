% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedRefTrigOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedRefTrigOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedRefTrigOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedRefTrigOutputTerm', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedChangeDetectEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedChangeDetectEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedChangeDetectEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedChangeDetectEventOutputTerm', taskHandle, data);
end

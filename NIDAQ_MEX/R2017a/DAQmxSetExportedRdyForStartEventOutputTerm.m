% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedRdyForStartEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedRdyForStartEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedRdyForStartEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedRdyForStartEventOutputTerm', taskHandle, data);
end

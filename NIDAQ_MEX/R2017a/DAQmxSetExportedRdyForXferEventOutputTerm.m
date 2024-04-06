% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedRdyForXferEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedRdyForXferEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedRdyForXferEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedRdyForXferEventOutputTerm', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedDataActiveEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedDataActiveEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedDataActiveEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedDataActiveEventOutputTerm', taskHandle, data);
end

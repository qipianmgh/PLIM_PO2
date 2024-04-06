% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedCtrOutEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedCtrOutEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedCtrOutEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedCtrOutEventOutputTerm', taskHandle, data);
end

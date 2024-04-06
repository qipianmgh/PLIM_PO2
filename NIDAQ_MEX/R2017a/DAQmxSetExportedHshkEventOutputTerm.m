% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedHshkEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedHshkEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedHshkEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedHshkEventOutputTerm', taskHandle, data);
end

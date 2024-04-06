% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedHshkEventOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedHshkEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExportedHshkEventOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExportedHshkEventOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExportedHshkEventOutputTerm', taskHandle, data, bufferSize);
end

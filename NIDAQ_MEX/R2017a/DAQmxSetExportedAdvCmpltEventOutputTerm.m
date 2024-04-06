% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExportedAdvCmpltEventOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExportedAdvCmpltEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExportedAdvCmpltEventOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExportedAdvCmpltEventOutputTerm', taskHandle, data);
end

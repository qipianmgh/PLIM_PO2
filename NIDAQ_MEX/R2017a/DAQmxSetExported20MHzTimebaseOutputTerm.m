% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetExported20MHzTimebaseOutputTerm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetExported20MHzTimebaseOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetExported20MHzTimebaseOutputTerm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetExported20MHzTimebaseOutputTerm', taskHandle, data);
end

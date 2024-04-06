% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeRefTrigHyst(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeRefTrigHyst', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgEdgeRefTrigHyst', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeRefTrigHyst', taskHandle, data);
end

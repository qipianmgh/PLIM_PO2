% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgEdgeStartTrigHyst(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeStartTrigHyst', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgEdgeStartTrigHyst', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgEdgeStartTrigHyst', taskHandle, data);
end

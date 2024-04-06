% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgEdgeStartTrigCoupling(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeStartTrigCoupling', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgEdgeStartTrigCoupling', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgEdgeStartTrigCoupling', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeRefTrigCoupling(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeRefTrigCoupling', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAnlgEdgeRefTrigCoupling', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeRefTrigCoupling', taskHandle, data);
end

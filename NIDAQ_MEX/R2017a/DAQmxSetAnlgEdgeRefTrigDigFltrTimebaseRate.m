% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate', taskHandle, data);
end

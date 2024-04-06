% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate', taskHandle, data);
end

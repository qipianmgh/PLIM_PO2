% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCloseExtCal(calHandle, action)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxCloseExtCal', 'calHandle', 1);
    validateattributes(action, {'int32'}, {'scalar'}, 'DAQmxCloseExtCal', 'action', 2);
    [status]= mexNIDAQmx('DAQmxCloseExtCal', calHandle, action);
end

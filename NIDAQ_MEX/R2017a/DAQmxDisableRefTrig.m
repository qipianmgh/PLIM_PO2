% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxDisableRefTrig(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxDisableRefTrig', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxDisableRefTrig', taskHandle);
end

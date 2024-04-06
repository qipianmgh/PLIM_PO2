% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIConvTimebaseSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIConvTimebaseSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAIConvTimebaseSrc', taskHandle);
end

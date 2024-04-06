% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIConvTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIConvTimebaseSrc', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAIConvTimebaseSrc', taskHandle, data);
end

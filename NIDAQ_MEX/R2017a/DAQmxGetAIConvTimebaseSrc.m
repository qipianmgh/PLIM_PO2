% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIConvTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIConvTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIConvTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAIConvTimebaseSrc', taskHandle, data);
end

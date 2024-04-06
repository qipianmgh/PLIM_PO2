% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetHshkSampleInputDataWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetHshkSampleInputDataWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetHshkSampleInputDataWhen', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetHshkSampleInputDataWhen', taskHandle, data);
end

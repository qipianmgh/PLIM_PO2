% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetHshkSampleInputDataWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetHshkSampleInputDataWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetHshkSampleInputDataWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetHshkSampleInputDataWhen', taskHandle, data);
end

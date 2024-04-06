% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIConvDigFltrTimebaseSrcEx', 'taskHandle', 1);
    validateattributes(deviceNames, {'char'}, {'vector'}, 'DAQmxSetAIConvDigFltrTimebaseSrcEx', 'deviceNames', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAIConvDigFltrTimebaseSrcEx', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetAIConvDigFltrTimebaseSrcEx', taskHandle, deviceNames, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxConfigureLogging(taskHandle, filePath, loggingMode, groupName, operation)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxConfigureLogging', 'taskHandle', 1);
    validateattributes(filePath, {'char'}, {'vector'}, 'DAQmxConfigureLogging', 'filePath', 2);
    validateattributes(loggingMode, {'int32'}, {'scalar'}, 'DAQmxConfigureLogging', 'loggingMode', 3);
    validateattributes(groupName, {'char'}, {'vector'}, 'DAQmxConfigureLogging', 'groupName', 4);
    validateattributes(operation, {'int32'}, {'scalar'}, 'DAQmxConfigureLogging', 'operation', 5);
    [status]= mexNIDAQmx('DAQmxConfigureLogging', taskHandle, filePath, loggingMode, groupName, operation);
end

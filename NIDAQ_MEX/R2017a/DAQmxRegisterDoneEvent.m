% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, callbackData] = DAQmxRegisterDoneEvent(task, options, callbackFunction, callbackData)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(task, {'uint64'}, {'scalar'}, 'DAQmxRegisterDoneEvent', 'task', 1);
    validateattributes(options, {'uint32'}, {'scalar'}, 'DAQmxRegisterDoneEvent', 'options', 2);
    validateattributes(callbackFunction, {'int32'}, {'scalar'}, 'DAQmxRegisterDoneEvent', 'callbackFunction', 3);
    validateattributes(callbackData, {'uint32'}, {'vector'}, 'DAQmxRegisterDoneEvent', 'callbackData', 4);
    [status, callbackData]= mexNIDAQmx('DAQmxRegisterDoneEvent', task, options, callbackFunction, callbackData);
end

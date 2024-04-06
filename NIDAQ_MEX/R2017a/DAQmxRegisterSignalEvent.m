% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, callbackData] = DAQmxRegisterSignalEvent(task, signalID, options, callbackFunction, callbackData)
    narginchk(5, 5);
    nargoutchk(2, 2);
    validateattributes(task, {'uint64'}, {'scalar'}, 'DAQmxRegisterSignalEvent', 'task', 1);
    validateattributes(signalID, {'int32'}, {'scalar'}, 'DAQmxRegisterSignalEvent', 'signalID', 2);
    validateattributes(options, {'uint32'}, {'scalar'}, 'DAQmxRegisterSignalEvent', 'options', 3);
    validateattributes(callbackFunction, {'int32'}, {'scalar'}, 'DAQmxRegisterSignalEvent', 'callbackFunction', 4);
    validateattributes(callbackData, {'uint32'}, {'vector'}, 'DAQmxRegisterSignalEvent', 'callbackData', 5);
    [status, callbackData]= mexNIDAQmx('DAQmxRegisterSignalEvent', task, signalID, options, callbackFunction, callbackData);
end

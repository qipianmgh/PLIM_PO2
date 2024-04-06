% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, callbackData] = DAQmxRegisterEveryNSamplesEvent(task, everyNsamplesEventType, nSamples, options, callbackFunction, callbackData)
    narginchk(6, 6);
    nargoutchk(2, 2);
    validateattributes(task, {'uint64'}, {'scalar'}, 'DAQmxRegisterEveryNSamplesEvent', 'task', 1);
    validateattributes(everyNsamplesEventType, {'int32'}, {'scalar'}, 'DAQmxRegisterEveryNSamplesEvent', 'everyNsamplesEventType', 2);
    validateattributes(nSamples, {'uint32'}, {'scalar'}, 'DAQmxRegisterEveryNSamplesEvent', 'nSamples', 3);
    validateattributes(options, {'uint32'}, {'scalar'}, 'DAQmxRegisterEveryNSamplesEvent', 'options', 4);
    validateattributes(callbackFunction, {'int32'}, {'scalar'}, 'DAQmxRegisterEveryNSamplesEvent', 'callbackFunction', 5);
    validateattributes(callbackData, {'uint32'}, {'vector'}, 'DAQmxRegisterEveryNSamplesEvent', 'callbackData', 6);
    [status, callbackData]= mexNIDAQmx('DAQmxRegisterEveryNSamplesEvent', task, everyNsamplesEventType, nSamples, options, callbackFunction, callbackData);
end

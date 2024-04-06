% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIFreqVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIFreqVoltageChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIFreqVoltageChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIFreqVoltageChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIFreqVoltageChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIFreqVoltageChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIFreqVoltageChan', 'units', 6);
    validateattributes(thresholdLevel, {'double'}, {'scalar'}, 'DAQmxCreateAIFreqVoltageChan', 'thresholdLevel', 7);
    validateattributes(hysteresis, {'double'}, {'scalar'}, 'DAQmxCreateAIFreqVoltageChan', 'hysteresis', 8);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIFreqVoltageChan', 'customScaleName', 9);
    [status]= mexNIDAQmx('DAQmxCreateAIFreqVoltageChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIVoltageChanWithExcit(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
    narginchk(12, 12);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageChanWithExcit', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageChanWithExcit', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'units', 7);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'bridgeConfig', 8);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'voltageExcitSource', 9);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'voltageExcitVal', 10);
    validateattributes(useExcitForScaling, {'uint32'}, {'scalar'}, 'DAQmxCreateAIVoltageChanWithExcit', 'useExcitForScaling', 11);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageChanWithExcit', 'customScaleName', 12);
    [status]= mexNIDAQmx('DAQmxCreateAIVoltageChanWithExcit', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName);
end

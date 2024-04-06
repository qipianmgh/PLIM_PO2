% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIRTDChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0)
    narginchk(11, 11);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIRTDChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIRTDChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'units', 6);
    validateattributes(rtdType, {'int32'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'rtdType', 7);
    validateattributes(resistanceConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'resistanceConfig', 8);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'currentExcitSource', 9);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'currentExcitVal', 10);
    validateattributes(r0, {'double'}, {'scalar'}, 'DAQmxCreateAIRTDChan', 'r0', 11);
    [status]= mexNIDAQmx('DAQmxCreateAIRTDChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0);
end

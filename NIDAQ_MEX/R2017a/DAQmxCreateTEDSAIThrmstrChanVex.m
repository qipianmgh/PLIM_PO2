% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIThrmstrChanVex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'units', 6);
    validateattributes(resistanceConfig, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'resistanceConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'voltageExcitVal', 9);
    validateattributes(r1, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmstrChanVex', 'r1', 10);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIThrmstrChanVex', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1);
end

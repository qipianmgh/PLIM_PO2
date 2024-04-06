% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIThrmstrChanVex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1)
    narginchk(13, 13);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIThrmstrChanVex', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIThrmstrChanVex', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'units', 6);
    validateattributes(resistanceConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'resistanceConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'voltageExcitVal', 9);
    validateattributes(a, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'a', 10);
    validateattributes(b, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'b', 11);
    validateattributes(c, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'c', 12);
    validateattributes(r1, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanVex', 'r1', 13);
    [status]= mexNIDAQmx('DAQmxCreateAIThrmstrChanVex', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1);
end

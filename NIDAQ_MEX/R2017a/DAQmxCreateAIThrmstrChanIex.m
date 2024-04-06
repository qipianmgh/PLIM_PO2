% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIThrmstrChanIex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c)
    narginchk(12, 12);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIThrmstrChanIex', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIThrmstrChanIex', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'units', 6);
    validateattributes(resistanceConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'resistanceConfig', 7);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'currentExcitSource', 8);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'currentExcitVal', 9);
    validateattributes(a, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'a', 10);
    validateattributes(b, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'b', 11);
    validateattributes(c, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmstrChanIex', 'c', 12);
    [status]= mexNIDAQmx('DAQmxCreateAIThrmstrChanIex', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c);
end

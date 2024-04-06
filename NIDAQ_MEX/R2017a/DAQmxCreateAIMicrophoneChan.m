% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIMicrophoneChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIMicrophoneChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIMicrophoneChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIMicrophoneChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIMicrophoneChan', 'terminalConfig', 4);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIMicrophoneChan', 'units', 5);
    validateattributes(micSensitivity, {'double'}, {'scalar'}, 'DAQmxCreateAIMicrophoneChan', 'micSensitivity', 6);
    validateattributes(maxSndPressLevel, {'double'}, {'scalar'}, 'DAQmxCreateAIMicrophoneChan', 'maxSndPressLevel', 7);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIMicrophoneChan', 'currentExcitSource', 8);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIMicrophoneChan', 'currentExcitVal', 9);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIMicrophoneChan', 'customScaleName', 10);
    [status]= mexNIDAQmx('DAQmxCreateAIMicrophoneChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName);
end

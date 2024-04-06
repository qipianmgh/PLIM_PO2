function status = DAQCreateAOVoltChan(taskHandle, physicalChannel, Voltrange)
status = DAQmxCreateAOVoltageChan(taskHandle,physicalChannel,' ',Voltrange(1),Voltrange(2),DAQmx_Val_Volts, ' ');
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(7, 7);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAOVoltageChan', 'taskHandle', 1);
%     validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAOVoltageChan', 'physicalChannel', 2);
%     validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAOVoltageChan', 'nameToAssignToChannel', 3);
%     validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAOVoltageChan', 'minVal', 4);
%     validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAOVoltageChan', 'maxVal', 5);
%     validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAOVoltageChan', 'units', 6);
%     validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAOVoltageChan', 'customScaleName', 7);
%     [status]= mexNIDAQmx('DAQmxCreateAOVoltageChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName);
end




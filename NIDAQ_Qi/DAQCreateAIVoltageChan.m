function status = DAQCreateAIVoltageChan(taskHandle, physicalChannel, Voltrange)

status = DAQmxCreateAIVoltageChan(taskHandle, physicalChannel, ' ', DAQmx_Val_Diff, Voltrange(1), Voltrange(2), DAQmx_Val_Volts, ' ');
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(8, 8);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIVoltageChan', 'taskHandle', 1);
%     validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageChan', 'physicalChannel', 2);
%     validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageChan', 'nameToAssignToChannel', 3);
%     validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIVoltageChan', 'terminalConfig', 4);
%     validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIVoltageChan', 'minVal', 5);
%     validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIVoltageChan', 'maxVal', 6);
%     validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIVoltageChan', 'units', 7);
%     validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageChan', 'customScaleName', 8);
%     [status]= mexNIDAQmx('DAQmxCreateAIVoltageChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName);
end

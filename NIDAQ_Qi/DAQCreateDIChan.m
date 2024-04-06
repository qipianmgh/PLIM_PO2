function status = DAQCreateDIChan(taskHandle, lines)
status = DAQmxCreateDIChan(taskHandle,lines, ' ', DAQmx_Val_ChanPerLine);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(4, 4);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateDIChan', 'taskHandle', 1);
%     validateattributes(lines, {'char'}, {'vector'}, 'DAQmxCreateDIChan', 'lines', 2);
%     validateattributes(nameToAssignToLines, {'char'}, {'vector'}, 'DAQmxCreateDIChan', 'nameToAssignToLines', 3);
%     validateattributes(lineGrouping, {'int32'}, {'scalar'}, 'DAQmxCreateDIChan', 'lineGrouping', 4);
%     [status]= mexNIDAQmx('DAQmxCreateDIChan', taskHandle, lines, nameToAssignToLines, lineGrouping);
end


function status = DAQSetAODACRefVal(taskHandle, channel, data)
status = DAQmxSetAODACRefVal(taskHandle,channel,data);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACRefVal', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACRefVal', 'channel', 2);
%     validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAODACRefVal', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetAODACRefVal', taskHandle, channel, data);
end





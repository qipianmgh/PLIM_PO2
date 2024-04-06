function [status, data] = DAQGetAODACRefVal(taskHandle, channel)
[status, data] = DAQmxGetAODACRefVal(taskHandle,channel, double(0));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
  errorString = DAQGetExtendedErrorInfo();
  error(errorString);
end

%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACRefVal', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACRefVal', 'channel', 2);
%     validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAODACRefVal', 'data', 3);
%     [status, data]= mexNIDAQmx('DAQmxGetAODACRefVal', taskHandle, channel, data);
end




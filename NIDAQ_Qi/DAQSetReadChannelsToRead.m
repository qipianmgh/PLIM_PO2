% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetReadChannelsToRead(taskHandle, data)
[status, data] = DAQmxSetReadChannelsToRead(taskHandle, data);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadChannelsToRead', 'taskHandle', 1);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetReadChannelsToRead', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxSetReadChannelsToRead', taskHandle, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetAICoupling(taskHandle, channel, data)
status = DAQmxSetAICoupling(taskHandle, char(channel), int32(data));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAICoupling', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAICoupling', 'channel', 2);
%     validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAICoupling', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetAICoupling', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetCICountEdgesTerm(taskHandle, channel, data)
[status, data] = DAQmxSetCICountEdgesTerm(taskHandle, channel, data);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICountEdgesTerm', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesTerm', 'channel', 2);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesTerm', 'data', 3);
%     [status, data]= mexNIDAQmx('DAQmxSetCICountEdgesTerm', taskHandle, channel, data);
end

% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetCICountEdgesTerm(taskHandle, channel, bufferSize)
[status, data] = DAQmxGetCICountEdgesTerm(taskHandle, channel, char([0]), uint32(bufferSize));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end

%     narginchk(4, 4);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICountEdgesTerm', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICountEdgesTerm', 'channel', 2);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCICountEdgesTerm', 'data', 3);
%     validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCICountEdgesTerm', 'bufferSize', 4);
%     [status, data]= mexNIDAQmx('DAQmxGetCICountEdgesTerm', taskHandle, channel, data, bufferSize);
end

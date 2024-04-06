% Copyright 2010 - 2015 The MathWorks, Inc.
function [status data] = DAQGetCOCtrTimebaseSrc(taskHandle, channel, bufferSize)
[status, data] = DAQmxGetCOCtrTimebaseSrc(taskHandle, char(channel), char([0]), uint32(bufferSize));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end

%     narginchk(4, 4);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOCtrTimebaseSrc', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOCtrTimebaseSrc', 'channel', 2);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCOCtrTimebaseSrc', 'data', 3);
%     validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCOCtrTimebaseSrc', 'bufferSize', 4);
%     [status, data]= mexNIDAQmx('DAQmxGetCOCtrTimebaseSrc', taskHandle, channel, data, bufferSize);
end

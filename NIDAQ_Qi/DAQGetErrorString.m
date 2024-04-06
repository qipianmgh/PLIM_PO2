% Copyright 2010 - 2015 The MathWorks, Inc.
function errorString = DAQGetErrorString(errorCode)
  [bufferSize, status] = DAQmxGetErrorString(int32(errorCode), char(NULL), uint32(0));
  [status, errorString] = DAQmxGetErrorString(int32(errorCode), blanks(bufferSize), uint32(bufferSize));
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(errorCode, {'int32'}, {'scalar'}, 'DAQmxGetErrorString', 'errorCode', 1);
%     validateattributes(errorString, {'char'}, {'vector'}, 'DAQmxGetErrorString', 'errorString', 2);
%     validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetErrorString', 'bufferSize', 3);
%     [status, errorString]= mexNIDAQmx('DAQmxGetErrorString', errorCode, errorString, bufferSize);
end

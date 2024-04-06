function errorString = DAQGetExtendedErrorInfo()
 
[bufferSize, status] = DAQmxGetExtendedErrorInfo(char(NULL), uint32(0));
[status, errorString] = DAQmxGetExtendedErrorInfo(blanks(bufferSize), uint32(bufferSize));

%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(errorString, {'char'}, {'vector'}, 'DAQmxGetExtendedErrorInfo', 'errorString', 1);
%     validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExtendedErrorInfo', 'bufferSize', 2);
%     [status, errorString]= mexNIDAQmx('DAQmxGetExtendedErrorInfo', errorString, bufferSize);
end

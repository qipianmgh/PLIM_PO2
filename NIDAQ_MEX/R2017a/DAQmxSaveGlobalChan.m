% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSaveGlobalChan(taskHandle, channelName, saveAs, author, options)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSaveGlobalChan', 'taskHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSaveGlobalChan', 'channelName', 2);
    validateattributes(saveAs, {'char'}, {'vector'}, 'DAQmxSaveGlobalChan', 'saveAs', 3);
    validateattributes(author, {'char'}, {'vector'}, 'DAQmxSaveGlobalChan', 'author', 4);
    validateattributes(options, {'uint32'}, {'scalar'}, 'DAQmxSaveGlobalChan', 'options', 5);
    [status]= mexNIDAQmx('DAQmxSaveGlobalChan', taskHandle, channelName, saveAs, author, options);
end

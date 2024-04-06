% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSaveTask(taskHandle, saveAs, author, options)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSaveTask', 'taskHandle', 1);
    validateattributes(saveAs, {'char'}, {'vector'}, 'DAQmxSaveTask', 'saveAs', 2);
    validateattributes(author, {'char'}, {'vector'}, 'DAQmxSaveTask', 'author', 3);
    validateattributes(options, {'uint32'}, {'scalar'}, 'DAQmxSaveTask', 'options', 4);
    [status]= mexNIDAQmx('DAQmxSaveTask', taskHandle, saveAs, author, options);
end

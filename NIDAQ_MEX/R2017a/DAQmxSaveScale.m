% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSaveScale(scaleName, saveAs, author, options)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSaveScale', 'scaleName', 1);
    validateattributes(saveAs, {'char'}, {'vector'}, 'DAQmxSaveScale', 'saveAs', 2);
    validateattributes(author, {'char'}, {'vector'}, 'DAQmxSaveScale', 'author', 3);
    validateattributes(options, {'uint32'}, {'scalar'}, 'DAQmxSaveScale', 'options', 4);
    [status]= mexNIDAQmx('DAQmxSaveScale', scaleName, saveAs, author, options);
end

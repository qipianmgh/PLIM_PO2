% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = unlockMex()
    narginchk(0, 0);
    nargoutchk(1, 1);
    [status]= mexNIDAQmx('unlockMex');
end

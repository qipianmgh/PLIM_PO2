function  outputstruct = obj2struct(obj)
properties = fieldnames(obj); 
for i = 1:length(properties)
    val = obj.(properties{i});
    if ~isstruct(val) & ~isobject(val)
       if ~isvector(val)
          outputstruct.(properties{i}) = val; 
       elseif isvector(val) & max(size(val)) <= 10000 
          outputstruct.(properties{i}) = val; 
       end 
    else
        
    end
end
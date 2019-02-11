function [ sum ] = psub( varargin )
msg =  'Input skal være polar, fx: padd(længde_1,vinkel_1,længde_2,vinkel_2)=sum';




if size(varargin{1})==[1 2]
    arrayinput = 1;
  elseif size(varargin{1})==[1 1]
    arrayinput = 0;
  else
    error(msg)
    
end

if arrayinput == 0
    if mod(nargin, 2) == 0
        if nargin == 2
        sum=[varargin{1} varargin{2}];
        warning('addition er typisk mere end ét tal')

        else
            
            p1=0;
            for m=1:2:nargin
            l=varargin{m};
            v=varargin{m+1};
            p=pol2kart(l,v);
            p1=p-p1;
            end
        
        sum=kart2pol(p1);
        
        end
        
    else
        
    error(msg)
end
elseif arrayinput == 1
   if mod(nargin, 2) == 0
        if nargin == 1
        sum=[varargin{1}];
        warning('addition er typisk mere end ét tal')

        else
            
            p1=0;
            for m=1:1:nargin
            l=varargin{m};
            v=varargin{m};
            p=pol2kart(l(1),v(2));
            p1=p-p1;
            end
        
        sum=kart2pol(p1);
        
        end
        
    else
        
    error(msg)
end
    
else error(msg)
    
end

end

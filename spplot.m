function [ pas ] = spplot(varargin)
%Plotter phasors

msg =  'Fejl';
set(0,'DefaultLegendAutoUpdate','off')
figure;
maxval = 0;
minval = 0;
first = 0;
if nargin == 1
    
    
    sum = varargin{1};
    Vinkel = sum(2);
    Scale = 1;
    Laengde = sum(1);
    vinkel = @(x) exp(1i*x*pi/180);
    dummyX=Laengde*Scale;
    plot=dummyX*vinkel(Vinkel);
    compass(plot);
    max_lim = abs(Laengde)*Scale ;
    x_fake=[0 max_lim 0 -max_lim];
    y_fake=[max_lim 0 -max_lim 0];
    h_fake=compass(x_fake,y_fake);
    hold on
    p1=compass(plot);
    set(h_fake,'Visible','off');
    set(findall(gcf, 'String', '30', '-or','String','60') ,'String', '  ');
    set(findall(gcf, 'String', '0'),'String', ' ' );
    set(findall(gcf, 'String', '330'),'String', ' ');
    set(findall(gcf, 'String', '300'),'String', ' ' );
    set(findall(gcf, 'String', '270'),'String', ' ');
    set(findall(gcf, 'String', '240'),'String', ' ' );
    set(findall(gcf, 'String', '210'),'String', ' ');
    set(findall(gcf, 'String', '180'),'String', ' ');
    set(findall(gcf, 'String', '150'),'String', ' ' );
    set(findall(gcf, 'String', '120'),'String', ' ');
    set(findall(gcf, 'String', '90'),'String', ' ' );
    
    for m=0:0.5:abs(Laengde)*2
        set(findall(gcf, 'String', ['  ' num2str(m)]),'String', '  ');
    end
    p1(1).LineWidth = 2;
    p1(1).Color='k';
    if 150 > Vinkel && Vinkel >= 0
        text(real(plot)+2,imag(plot)+2,[ num2str(abs(Laengde)) ' {\angle} ' num2str(Vinkel) '^{\circ}' ])
    elseif 360 > Vinkel && Vinkel >= 210
        text(real(plot)-2,imag(plot)-2,[ num2str(abs(Laengde)) ' {\angle} ' num2str(Vinkel) '^{\circ}' ])
    elseif 210 > Vinkel && Vinkel >= 150
        text(real(plot)-2,imag(plot)+2,[ num2str(abs(Laengde)) ' {\angle} ' num2str(Vinkel) '^{\circ}' ])
    elseif Vinkel < 0
        text(real(plot)-2,imag(plot)-2,[ num2str(abs(Laengde)) ' {\angle} ' num2str(Vinkel) '^{\circ}' ])
    else
        msg = 'Error occurred.';
        error(msg)
    end
    
elseif nargin >= 2
    clrs=['k' , 'r' , 'b'  , 'g' , 'y' , 'c','m'];
    
    
    
    
    
    for m=1:1:nargin
        M = varargin{m};
        Vinkel = M(2);
        
        Laengde = M(1);
        
        if contains(inputname(m),'v','IgnoreCase',true)
            Scale = 1;
            enhed = 'V';
            pre = strcat(inputname(m), ': ');
        elseif contains(inputname(m),'I','IgnoreCase',true)
            Scale = 1;
            enhed = 'A';
            pre = strcat(inputname(m), ': ');
            
        elseif contains(inputname(m),'X','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            if Vinkel > 0
                pre='X_L:' ;
            elseif Vinkel < 0
                pre='X_C:' ;
            else
                error(msg)
            end
        elseif contains(inputname(m),'S','IgnoreCase',true)
            Scale = 1;
            enhed = 'VA';
            pre='S:';
        elseif contains(inputname(m),'Q','IgnoreCase',true)
            Scale = 1;
            enhed = 'VAr';
            pre='Q:';
        elseif contains(inputname(m),'P','IgnoreCase',true)
            Scale = 1;
            enhed = 'W';
            pre='P:';
        elseif contains(inputname(m),'R','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre='R:';
        elseif contains(inputname(m),'Z','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre='Z:';
        else
            error(msg);
        end
        
        
       
        
        if first == 0
        for ii=1:1:nargin 
            O = varargin{ii};
            if abs(O(1)) > maxval
                maxval = abs(O(1)); 

            end
            
        end
         
        
        
        max_lim = abs(maxval) ;
        x_fake=[0 max_lim 0 -max_lim];
        y_fake=[max_lim 0 -max_lim 0];
        h_fake=compass(x_fake,y_fake);
        hold on
        first = 1;
        end
        
        
        
        vinkel = @(x) exp(1i*x*pi/180);
        dummyX=Laengde*Scale;
        plot=dummyX*vinkel(Vinkel);
        
        
        p1=compass(plot);
        if m == nargin
        set(h_fake,'Visible','off');
        set(findall(gcf, 'String', '30', '-or','String','60') ,'String', '  ');
        set(findall(gcf, 'String', '0'),'String', ' ' );
        set(findall(gcf, 'String', '330'),'String', ' ');
        set(findall(gcf, 'String', '300'),'String', ' ' );
        set(findall(gcf, 'String', '270'),'String', ' ');
        set(findall(gcf, 'String', '240'),'String', ' ' );
        set(findall(gcf, 'String', '210'),'String', ' ');
        set(findall(gcf, 'String', '180'),'String', ' ');
        set(findall(gcf, 'String', '150'),'String', ' ' );
        set(findall(gcf, 'String', '120'),'String', ' ');
        set(findall(gcf, 'String', '90'),'String', ' ' );
        
        
        for u=0:1:abs(maxval)*1.5
            set(findall(gcf, 'String', ['  ' num2str(u)]),'String', '  ');
        end
        end
        
        
        
        string=strcat(num2str(Laengde,'%100.2f'),' \angle ',num2str(Vinkel,'%100.2f'),'^{\circ}');
        p1(1).LineWidth = 2;
        p1(1).Color=clrs(m);
        p1(1).DisplayName=string;
        
        
        
        if 150 > Vinkel && Vinkel >= 0 || 150 > 360-Vinkel && 360-Vinkel >= 0
            text(real(plot)+real(plot)/8,imag(plot)+imag(plot)/8,[pre ' ' num2str(abs(Laengde),'%100.2f') ' '  enhed ' {\angle} ' num2str(Vinkel,'%100.2f') '^{\circ}' ])
            
        elseif 360 > Vinkel && Vinkel >= 210 || 360 > 360-Vinkel && 360-Vinkel >= 210
            text(real(plot)+real(plot)/8,imag(plot)+imag(plot)/8,[pre ' ' num2str(abs(Laengde),'%100.2f') ' ' enhed ' {\angle} ' num2str(Vinkel,'%100.2f') '^{\circ}' ])
            
        elseif 210 > Vinkel && Vinkel >= 150 || 210 > 360-Vinkel && 360-Vinkel >= 150
            text(real(plot)+real(plot)/8,imag(plot)+imag(plot)/8,[pre ' ' num2str(abs(Laengde),'%100.2f') ' '  enhed ' {\angle} ' num2str(Vinkel,'%100.2f') '^{\circ}' ])
            
        elseif Vinkel < 0 || 360-Vinkel < 0
            text(real(plot)+real(plot)/8,imag(plot)+imag(plot)/8,[pre ' ' num2str(abs(Laengde),'%100.2f') ' ' enhed ' {\angle} ' num2str(Vinkel,'%100.2f') '^{\circ}' ])
            
        else
            error(msg)
            
            
        end
        
        
        
        
    end
    
else
    error(msg)
    
    
end
hold off
end
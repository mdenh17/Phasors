function [ pas ] = spplot(varargin)
%Plotter phasors
figure1=figure('Position', [0, 0, 1024, 1200]);
subplot(2,1,1)

msg =  'Fejl';


maxval = 0;
minval = 0;
clrs = {[0 0.4470 0.7410], 	[0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560],[0.4660 0.6740 0.1880],[0.3010 0.7450 0.9330],  	[0.6350 0.0780 0.1840]};


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
    
    %----------------------------------------------------
    
    %----------------------------------------------------
    
elseif nargin >= 2
    
    
    for m=1:1:nargin
        
        M = varargin{m};
        Vinkel = M(2);
        
        Laengde = M(1);
        
        if contains(inputname(m),'v','IgnoreCase',true)
            Scale = 1;
            enhed = 'V';
            pre = strcat(inputname(m));
        elseif contains(inputname(m),'I','IgnoreCase',true)
            Scale = 1;
            enhed = 'A';
            pre = strcat(inputname(m));
            
        elseif contains(inputname(m),'X','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre = strcat(inputname(m));
            
        elseif contains(inputname(m),'S','IgnoreCase',true)
            Scale = 1;
            enhed = 'VA';
            pre = strcat(inputname(m));
        elseif contains(inputname(m),'Q','IgnoreCase',true)
            Scale = 1;
            enhed = 'VAr';
            pre = strcat(inputname(m));
        elseif contains(inputname(m),'P','IgnoreCase',true)
            Scale = 1;
            enhed = 'W';
            pre = strcat(inputname(m));
        elseif contains(inputname(m),'R','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre = strcat(inputname(m));
        elseif contains(inputname(m),'Z','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre = strcat(inputname(m));
        else
            Scale = 1;
            enhed = ' ';
            pre=inputname(m);
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
        dummyX=(Laengde*Scale);
        plot=dummyX*vinkel(Vinkel);
        
           
        %txt=strcat(pre, ' ' ,num2str(abs(Laengde),'%100.2f'), ' ' ,enhed, ' {\angle} ' ,num2str(Vinkel,'%100.2f'), '^{\circ}')
    
        
        p1=compass(plot);
        
            %if m == nargin
            set(h_fake,'Visible','off');
            %{
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
            
            
            
                
                    for u=0:1/abs(maxval):(abs(maxval))*3
                        set(findall(gcf, 'String', ['  ' num2str(u)]),'String', '  ');
                    end
                
                
           
        end
        %}
        
        
        
        p1(1).LineWidth = 2;
        p1(1).Color=clrs{m};
        %p1(1).DisplayName=string;
        
        
        
        
        text(real(plot)*1.15,imag(plot)*1.15,[pre])
    end
    hold off

    
end
hold off

%---------------------------------------------------------------
firstthis = 0;
subplot(2,1,2)

for k=1:1:nargin
    str=inputname(k);
    sammenlign = regexpi(str,'[a-z]+','match','once');
    if contains(sammenlign,'v','IgnoreCase',true)
            Scale = 1;
            enhed = 'V';
            pre = strcat(str, ': ');
        elseif contains(sammenlign,'I','IgnoreCase',true)
            Scale = 1;
            enhed = 'A';
            pre = strcat(str, ': ');
            
        elseif contains(sammenlign,'X','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            if Vinkel > 0
                pre='X_L:' ;
            elseif Vinkel < 0
                pre='X_C:' ;
            else
                msg = 'Error occurred.';
                error(msg)
            end
        elseif contains(sammenlign,'S','IgnoreCase',true)
            Scale = 1;
            enhed = 'VA';
            pre = strcat(str, ': ');
        elseif contains(sammenlign,'Q','IgnoreCase',true)
            Scale = 1;
            enhed = 'VAr';
            pre = strcat(str, ': ');
        elseif contains(sammenlign,'P','IgnoreCase',true)
            Scale = 1;
            enhed = 'W';
            pre = strcat(str, ': ');
        elseif contains(sammenlign,'R','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre = strcat(str, ': ');
        elseif contains(sammenlign,'Z','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre = strcat(str, ': ');
        else
            Scale = 1;
            enhed = ' ';
            pre = strcat(str, ': ');
        end
    
    BB = varargin{k};
    Vinkel1 = BB(2);
    
    Laengde1 = BB(1);
    
    xt = @(t) Laengde1.*sin(2*pi*t-(deg2rad(Vinkel1)));
    p2=fplot(xt,[0 2]);
    string=strcat(num2str(Laengde1,'%100.2f'),' \angle ',num2str(Vinkel1,'%100.2f'),'^{\circ}');
    string1=strcat(pre, 32 ,num2str(abs(Laengde1),'%100.2f'),  32 , enhed ,  32 ,' {\angle} ', num2str(Vinkel1,'%100.2f'), '^{\circ}' );
    grid on
    ax = gca;
    ax.XTick =  0:0.25:2;
    ax.XTickLabel = {'0^\circ','90^\circ','180^\circ','270^\circ','360^\circ','450^\circ','540^\circ','630^\circ','720^\circ'};
    
    p2(1).LineWidth = 2;
    p2(1).Color=clrs{k};
    p2(1).DisplayName=string1;
    
    hold on
end

hold off
legend show









end

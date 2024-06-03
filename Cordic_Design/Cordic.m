format long;

Xi = 1;
Yi = 0;

angle = [0.0;
    0.05 ;
    0.1 ;
    0.15;
    0.2 ;
    0.25 ;
    0.3 ;
    0.35;
    0.4 ;
    0.45 ;
    0.5 ;
    0.55 ;
    0.6 ;
    0.65 ;
    0.7 ;
    0.75 ;
    0.785];

%angle = [0.15];


rot_err_s = [];
rot_err_c = [];

res_angle = [];
cosh_prop = [];
sinh_prop = [];

Xn1 =0; Xn2 =0; Xn3 =0; Xn4 =0; Xc = 0;
Yn1 =0; Yn2 =0; Yn3 =0; Yn4 =0; Yc = 0;

for n = 1 : length(angle)
       
    
    a = (angle(n));
rot_s = 0;
rot_c = 0;
% a = 0.42;

am = abs(a);

if (am > 0.25)
    if(a>0) 
        a = a - 0.5; 
        Xn1 = Xi*(1+ 2^-3 + 2^-9 + 2^-11 + 2^-15) + Yi*(2^-1 + 2^-6 +2^-8 + 2^-10 + 2^-11);
        Yn1 = Yi*(1+ 2^-3 + 2^-9 + 2^-11 + 2^-15) + Xi*(2^-1 + 2^-6 +2^-8 + 2^-10 + 2^-11);
        Xc = Xi*(cosh(2^-1)) + Yi*(sinh(2^-1));
        Yc = Yi*(cosh(2^-1)) + Xi*(sinh(2^-1));
    else
        a = a + 0.5;
        Xn1 = Xi*(1+ 2^-3 + 2^-9 + 2^-11 + 2^-15) - Yi*(2^-1 + 2^-6 +2^-8 + 2^-10 + 2^-11);
        Yn1 = Yi*(1+ 2^-3 + 2^-9 + 2^-11 + 2^-15) - Xi*(2^-1 + 2^-6 +2^-8 + 2^-10 + 2^-11);
        Xc = Xi*(cosh(2^-1)) - Yi*(sinh(2^-1));
        Yc = Yi*(cosh(2^-1)) - Xi*(sinh(2^-1));
    end
else 
    Xn1 = Xi;
    Yn1 = Yi;

end

rot_c = rot_c + abs(Xn1-Xc);
rot_s = rot_s + abs(Yn1-Yc);


am = abs(a);



if (am > 0.0625)
    if (am > 0.1825) 
        if (a>0)
            a = a - 0.25;
            Xn2 = Xn1*(1 + 2^-5 + 2^-13 + 2^-15) + Yn1*(2^-2 + 2^-9 + 2^-11 + 2^-13);
            Yn2 = Yn1*(1 + 2^-5 + 2^-13 + 2^-15) + Xn1*(2^-2 + 2^-9 + 2^-11 + 2^-13);
            Xc = Xn1*(cosh(2^-2)) + Yn1*(sinh(2^-2));
            Yc = Yn1*(cosh(2^-2)) + Xn1*(sinh(2^-2));
        else 
            a = a + 0.25;
            Xn2 = Xn1*(1 + 2^-5 + 2^-13 + 2^-15) - Yn1*(2^-2 + 2^-9 + 2^-11 + 2^-13);
            Yn2 = Yn1*(1 + 2^-5 + 2^-13 + 2^-15) - Xn1*(2^-2 + 2^-9 + 2^-11 + 2^-13);
            Xc = Xn1*(cosh(2^-2)) - Yn1*(sinh(2^-2));
            Yc = Yn1*(cosh(2^-2)) - Xn1*(sinh(2^-2));
        end
    else 
        if (a>0)
            a = a - 0.125;
            Xn2 = Xn1*(1 + 2^-7) + Yn1*(2^-3 + 2^-12 + 2^-14);
            Yn2 = Yn1*(1 + 2^-7) + Xn1*(2^-3 + 2^-12 + 2^-14);
            Xc = Xn1*(cosh(2^-3)) + Yn1*(sinh(2^-3));
            Yc = Yn1*(cosh(2^-3)) + Xn1*(sinh(2^-3));
        else 
            a = a + 0.125;
            Xn2 = Xn1*(1 + 2^-7) - Yn1*(2^-3 + 2^-12 + 2^-14);
            Yn2 = Yn1*(1 + 2^-7) - Xn1*(2^-3 + 2^-12 + 2^-14);
            Xc = Xn1*(cosh(2^-3)) - Yn1*(sinh(2^-3));
            Yc = Yn1*(cosh(2^-3)) - Xn1*(sinh(2^-3));
        end
    end

else
    Xn2 = Xn1;
    Yn2 = Yn1;
end



rot_c = rot_c + abs(Xn2-Xc);
rot_s = rot_s + abs(Yn2-Yc);

am = abs(a);



if (am > 0.015625)
    if (am > 0.0468725)
        if (a>0)
            a = a - 0.0625;
            Xn3 = Xn2*(1 + 2^-9) + Yn2*(2^-4 + 2^-15);
            Yn3 = Yn2*(1 + 2^-9) + Xn2*(2^-4 + 2^-15);
            Xc = Xn2*(cosh(2^-4)) + Yn2*(sinh(2^-4));
            Yc = Yn2*(cosh(2^-4)) + Xn2*(sinh(2^-4));
        else 
            a = a + 0.0625;
            Xn3 = Xn2*(1 + 2^-9) - Yn2*(2^-4 + 2^-15);
            Yn3 = Yn2*(1 + 2^-9) - Xn2*(2^-4 + 2^-15);
            Xc = Xn2*(cosh(2^-4)) - Yn2*(sinh(2^-4));
            Yc = Yn2*(cosh(2^-4)) - Xn2*(sinh(2^-4));
        end

    else 
        if (a>0)
            a = a - 0.03125;
            Xn3 = Xn2*(1 + 2^-11) + Yn2*(2^-5);
            Yn3 = Yn2*(1 + 2^-11) + Xn2*(2^-5);
            Xc = Xn2*(cosh(2^-5)) + Yn2*(sinh(2^-5));
            Yc = Yn2*(cosh(2^-5)) + Xn2*(sinh(2^-5));
        else 
            a = a + 0.03125;
            Xn3 = Xn2*(1 + 2^-11) - Yn2*(2^-5);
            Yn3 = Yn2*(1 + 2^-11) - Xn2*(2^-5);
            Xc = Xn2*(cosh(2^-5)) - Yn2*(sinh(2^-5));
            Yc = Yn2*(cosh(2^-5)) - Xn2*(sinh(2^-5));
        end

    end

else
    Yn3 = Yn2;
    Xn3 = Xn2;
end


rot_c = rot_c + abs(Xn3-Xc);
rot_s = rot_s + abs(Yn3-Yc);


%following i = 7
if (a>0)
    a = a - 0.0078125;
    Xn4 = Xn3*(1 + 2^-15) + Yn3*(2^-7);
    Yn4 = Yn3*(1 + 2^-15) + Xn3*(2^-7);
    Xc = Xn3*(cosh(2^-7)) + Yn3*(sinh(2^-7));
    Yc = Yn3*(cosh(2^-7)) + Xn3*(sinh(2^-7));

else 
    a = a + 0.0078125;
    Xn4 = Xn3*(1 + 2^-15) - Yn3*(2^-7);
    Yn4 = Yn3*(1 + 2^-15) - Xn3*(2^-7);
    Xc = Xn3*(cosh(2^-7)) - Yn3*(sinh(2^-7));
    Yc = Yn3*(cosh(2^-7)) - Xn3*(sinh(2^-7));
end

%final cosh and sinh values
sinh_prop(n) = Yn4;
cosh_prop(n) = Xn4;

%Rotational Error
rot_c = rot_c + abs(Xn4-Xc);
rot_s = rot_s + abs(Yn4-Yc);


% Residual angle
res_angle(n) = a;
rot_err_c(n) = rot_c;
rot_err_s(n) = rot_s;


end

sinh_prop = sinh_prop.';
cosh_prop = cosh_prop.';

res_angle = res_angle.';
rot_err_s = rot_err_s.';
rot_err_c = rot_err_c.';

[sinh_gold, cosh_gold] = cordicsinhcosh(angle);


% Determining the Residual Error

angle_r = angle - res_angle;
[sinh_res, cosh_res] = cordicsinhcosh(angle_r);

err_res_sinh = sinh_res - sinh_prop;
err_res_cosh = cosh_res - cosh_prop;


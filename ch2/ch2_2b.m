%ch2_2b.m
function [P_error] = ch2_2b(x0,c_w1,sig_w1,c_w2,sig_w2)

p_error1 = normcdf([x0(1) x0(2)],c_w1,sig_w1);
p_error2 = normcdf([x0(1) x0(2)],c_w2,sig_w2);

P_error=1-(p_error1(2)-p_error1(1)) + (p_error2(2)-p_error2(1));
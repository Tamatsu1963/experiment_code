function speed = f_no_opt_speed(track_data,s3n)

    Fpattern = 'F';
    if s3n>0
        L_track_data = track_data(:,1:2:20);
        F_indx = contains(L_track_data,Fpattern);
        Fn =nnz(F_indx);
        if Fn>0
            time_track_data = str2double(track_data(:,2:2:20));
            for p=1:10
                for o=1:8
                    if F_indx(o,p)==1
                        reward_indx(o-1,p)=1;
                        reward_indx(o,p)=1;
                    else
                        reward_indx(o,p)=0;
                    end
                end
            end
            reward_indx =logical(reward_indx);
            speed_data = time_track_data(reward_indx)';
            sp_diff = diff(speed_data);
            spd_size = size(sp_diff);
            sp =sp_diff(1,1:2:spd_size(1,2));
            sp_size = size(sp);
            speed =(15*50*ones(1,sp_size(1,2))./sp)';
        else
            speed = NaN(1,10)';
        end
    elseif s3n==0
        speed = NaN(1,10)';
    end
end
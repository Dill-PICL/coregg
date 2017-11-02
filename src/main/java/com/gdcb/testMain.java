package com.gdcb;

import java.util.Arrays;

public class testMain {
    public static void main(String[] args) {
        Integer[] ary1 = new Integer[]{3,2,4,5,7,1};// 3<2<4<5<7<1
        Integer[] ary2 = new Integer[]{2,5,3,3,4,7,1,7,5};
        Arrays.sort(ary2,(a,b)-> {
            int i=0;
            int j=0;
            for(int k = 0 ; k < ary1.length; k++){
                if (ary1[k]==a)
                    i=k;
                if (ary1[k]==b)
                    j=k;
            }
            return i-j;
        });
        System.out.println(Arrays.toString(ary2));
    }
}

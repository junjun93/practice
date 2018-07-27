package com.junjun.beans;


import lombok.*;

import java.util.Set;

/**
 * @author junjun
 * @date 2018/7/27 15:01:29
 **/
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Mail {

    public String subject;

    public String message;

    public Set<String> receivers;
}

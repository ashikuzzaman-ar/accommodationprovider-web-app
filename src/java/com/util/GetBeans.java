package com.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GetBeans {
    
    private static Object bean ;
    private static final ApplicationContext context  = new ClassPathXmlApplicationContext("beans.xml");

    public static Object getBean(String beanName) {
        
        try {
            
            bean = context.getBean(beanName);
            return bean;
        } catch (Exception e) {
            
            return null;
        }
    } 
}

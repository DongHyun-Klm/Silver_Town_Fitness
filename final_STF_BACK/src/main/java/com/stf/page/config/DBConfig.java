package com.stf.page.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "com.stf.page.model.dao")
public class DBConfig {

}

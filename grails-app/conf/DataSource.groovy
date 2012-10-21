dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
    
    // resolve an issue with stale connections and Grails due to automatic
    // connection pooling done by Grails (enabled above)
    // http://stackoverflow.com/questions/2740987/mysql-connection-timeout-issue-grails-application-on-tomcat-using-hibernate-an
    
    // run the evictor every 30 minutes and evict any connections older than 30 minutes.
    minEvictableIdleTimeMillis = 1800000
    timeBetweenEvictionRunsMillis = 1800000
    numTestsPerEvictionRun = 3
    
    // test the connection while its idle, before borrow and return it
    testOnBorrow = true
    testWhileIdle = true
    testOnReturn = true
    validationQuery = "SELECT 1"
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            driverClassName = 'com.mysql.jdbc.Driver'
            dbCreate = 'update'
            url = 'jdbc:mysql://localhost:3306/nineteen'
            username = 'nineteen'
            password = '3JHwYzwXvJNrqLzwobTh2G61fm3xV0'
            dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
        }
    }
}

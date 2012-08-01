dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
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

(ns facepalm.c2-10-0-2016120101
    (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.15.0:20170802.02")

(defn- add-container-ports-table
  "Adds the container_ports table."
  []
  (println "\t* adding the container_ports table")
  (load-sql-file "tables/78_container_ports.sql")
  (load-sql-file "constraints/78_container_ports.sql"))

(defn convert
  "Performs the conversion for this database version."
  []
  (println "Performing the conversion for" version)
  (add-container-ports-table))

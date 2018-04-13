(ns facepalm.c2-21-0-2018041301
  (:use [kameleon.sql-reader :only [exec-sql-statement]])
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.21.0:20180413.01")

(defn- update-path
  [path-prefix]
  (sql/update :genome_reference
              (sql/set-fields {:path (sql/sqlfn replace :path path-prefix "/cvmfs/genomeservices.cyverse.org/")})
              (sql/where {:deleted false
                          :path    [like (str path-prefix "%")]})))

(defn- update-genome-reference-cvmfs-paths
  "Updates the genome_reference path values to /cvmfs/genomeservices.cyverse.org paths."
  []
  (println "\t* updating genome_reference path values to /cvmfs/genomeservices.cyverse.org paths...")
  (update-path "/data2/collections/genomeservices/0.2.1/")
  (update-path "/data2/collections/genomeservices/1.0.0/14_67/")
  (update-path "/data2/collections/genomeservices/1.0.0/19_72/")
  (update-path "/data2/collections/genomeservices/1.0.0/24_77/")
  (update-path "/data2/collections/genomeservices/1.0.0/jcvi-medicago/")
  (update-path "/data2/collections/genomeservices/1.0.0/phytozome/9.0/"))

(defn convert
  "Performs the conversion for this database version."
  []
  (println "Performing the conversion for" version)
  (update-genome-reference-cvmfs-paths))

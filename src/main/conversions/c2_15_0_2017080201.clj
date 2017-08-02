(ns facepalm.c2-15-0-2017080201
    (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.15.0:20170802.01")

(defn- add-interactive-flag
  "Adds the interactive field to the tools table"
  []
  (println "\t*adding the interactive flag to the tools table")
  (exec-sql-statement
   "ALTER TABLE ONLY tools ADD COLUMN interactive BOOLEAN NOT NULL DEFAULT FALSE"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-interactive-flag))

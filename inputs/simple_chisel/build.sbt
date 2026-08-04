// Build definition for the simple_chisel mock RTL project.
// Uses Chisel from the Chips Alliance (Chisel 6.x).

val chiselVersion = "6.7.0"

ThisBuild / scalaVersion := "2.13.14"
ThisBuild / version      := "0.1.0"
ThisBuild / organization := "simplechisel"

lazy val root = (project in file("."))
  .settings(
    name := "simple_chisel",
    libraryDependencies ++= Seq(
      "org.chipsalliance" %% "chisel" % chiselVersion
    ),
    addCompilerPlugin(
      "org.chipsalliance" % "chisel-plugin" % chiselVersion cross CrossVersion.full
    ),
    scalacOptions ++= Seq(
      "-deprecation",
      "-feature",
      "-unchecked"
    )
  )

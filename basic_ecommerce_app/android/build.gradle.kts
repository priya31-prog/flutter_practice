
//val kotlin_version ="1.9.22"

buildscript {

    val kotlin_version by extra("2.0.21")
    repositories{
        google()
        mavenCentral()
    }

  
}
    allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

plugins{
    id("com.android.application") version "8.7.0" apply false
    id("org.jetbrains.kotlin.android") version "2.0.21" apply false
    id("e.google-services") version "4.4.2" apply false
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
